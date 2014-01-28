from django import forms
from haystack.forms import FacetedSearchForm


class MultiFacetedSearchForm(FacetedSearchForm):
    def __init__(self, *args, **kwargs):
        self.selected_facets = kwargs.pop("selected_facets", [])
        super(MultiFacetedSearchForm, self).__init__(*args, **kwargs)

    def search(self):
        sqs = super(MultiFacetedSearchForm, self).search()

        # We need to process each facet to ensure that the field name and the
        # value are quoted correctly and separately:
        for facet in self.selected_facets:
            if ":" not in facet:
                continue

            field, value = facet.split(":", 1)

            if value:
                sqs = sqs.narrow(u'%s:"%s"' % (field, sqs.query.clean(value)))

        return sqs