# Adding resources

**Important:** Read [this doc](https://sigs.k8s.io/apiserver-builder-alpha/docs/adding_resources.md)
first to understand how resources are added

## Customizing the table format of a resource

You can customize the columns which are shown by default when `kubectl get` is called on your resource.
This is done by providing the `tableconverter=FooTableConverter` parameter
and providing a `NewFooTableConverter() rest.TableConverter {}` function to return the 
table converter for a given resource.  Note that the converter works on the internal version
of your resource.

```go
// +genclient=true
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// +resource:path=foos,tableconverter=FooTableConverter
// +k8s:openapi-gen=true
// Foo defines some thing
type Foo struct {
    // Your resource definition here
}

// Initialize custom table converter
func NewFooTableConverter() rest.TableConvertor {
    // Implement a table converter or return the default one:
	gr := SchemeGroupVersion.WithResource("foos").GroupResource()
	return rest.NewDefaultTableConvertor(gr)
}
```

