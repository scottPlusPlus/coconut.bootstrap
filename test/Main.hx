package;

import js.Browser.document;
import js.Browser.window;
import js.Browser.location;
import bootstrap.*;
import bootstrap.Container;
import bootstrap.types.Variant;
import bootstrap.types.Size;
import bootstrap.Bootstrap;
import coconut.Ui.hxx;
import coconut.vdom.View;
import coconut.ui.Children;
import tink.domspec.ClassName;

using StringTools;

class Main {
	static function main() {
		coconut.ui.Renderer.mount(
			cast document.body.appendChild(document.createDivElement()), hxx('<Root />')
		);
	}
}

class Root extends View {
	function render() '
	<Container fluid>
		<Row>
			<Col className="col-lg-2">
				<div class="sticky-top border-right py-3">
					<dl>
						<dt><a href="#components">Components</a></dt>
						<dd><a href="#alert">Alert</a></dd>
						<dd><a href="#badge">Badge / Pill</a></dd>
						<dd><a href="#breadcrumb">Breadcrumb</a></dd>
						<dd><a href="#button">Buttons</a></dd>
						<dd><a href="#button-group">Button Group</a></dd>
						<dd><a href="#card">Card</a></dd>
						<dd><a href="#dropdown">Dropdown</a></dd>
						<dd><a href="#image">Images</a></dd>
						<dd><a href="#jumbotron">Jumbotron</a></dd>
						<dd><a href="#pagination">Pagination</a></dd>
						<dd><a href="#progress">Progress bars</a></dd>
					</dl>
				</div>
			</Col>
			<Col>
				<h1 class="display-4 my-5">Coconut.ui 🥥 <small><Badge variant=${Info}>bootstrap components</Badge></small></h1>
				<H2 name="components">Components</H2>
				<hr/>
				<H3 name="alert">Alert</H3>
				<p class="lead">Provide contextual feedback messages for typical user actions with the handful of available and flexible alert messages.</p>
				<previewSection>
					<for ${variant in Variant.all}>
						<Alert variant=${variant} dismissible>
							This is a ${variant} alert. Check it out!
						</Alert>
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}>
						<Alert variant=${variant} dismissible>
							This is a ${variant} alert. Check it out!
						</Alert>
						</for>
					"}</codeExample>

					<H4 name="alert-heading">Alert Heading</H4>
					<let variant=${Primary}>
						<Alert variant=${variant}>
							<Alert.Heading>Hey, nice to see you!</Alert.Heading>
							This is a ${variant} alert.
							<hr/>
							Everything works as intended.
						</Alert>
					</let>
					<codeExample>${"
						<let variant=${Primary}>
						<Alert variant=${variant}>
							<Alert.Heading>Hey, nice to see you!</Alert.Heading>
							<div>This is a ${variant} alert. </div>
							<hr/>
							<div>Everything works as intended.</div>
						</Alert>
					</let>
					"}</codeExample>
				</previewSection>

				<H3 name="badge">Badge</H3>
				<p class="lead">Badges scale to match the size of the immediate parent element by using relative font sizing and em units.</p>
				<previewSection>
					<H4 name="badge-variants">Badge variants</H4>
					<p>Add any of the below mentioned <code>variant</code> modifier classes to change the appearance of a badge.</p>
					<for ${variant in Variant.all}>
						<Badge variant=${variant}>${variant}</Badge>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}><Badge variant=${variant}>${variant}</Badge></for>
					"}</codeExample>

					<H4 name="badge-pill">Pill badge</H4>
					<p> Pill badges use the <code>pill</code> modifier class to make badges more rounded.</p>
					<for ${variant in Variant.all}>
						<Badge variant=${variant} pill=${true}>${variant}</Badge>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}><Badge variant=${variant} pill=${true}>${variant}</Badge></for>
					"}</codeExample>
				</previewSection>

				<H3 name="breadcrumb">Breadcrumb</H3>
				<p class="lead">Indicate the current page’s location within a navigational hierarchy that automatically adds separators via CSS.</p>
				<previewSection>
					<Breadcrumb>
						<Breadcrumb.Item href="#">Home</Breadcrumb.Item>
						<Breadcrumb.Item href="https://getbootstrap.com/docs/4.0/components/breadcrumb/">
							Library
						</Breadcrumb.Item>
						<Breadcrumb.Item active>Data</Breadcrumb.Item>
					</Breadcrumb>
					<codeExample>${"
						<Breadcrumb>
							<Breadcrumb.Item href='#'>Home</Breadcrumb.Item>
							<Breadcrumb.Item href='https://getbootstrap.com/docs/4.0/components/breadcrumb/'>
								Library
							</Breadcrumb.Item>
							<Breadcrumb.Item active>Data</Breadcrumb.Item>
						</Breadcrumb>
					"}</codeExample>
				</previewSection>

				<H3 name="button">Buttons</H3>
				<p class="lead">Custom button styles for actions in forms, dialogs, and more with support for multiple sizes, states, and more.</p>
				<previewSection>
					<H4 name="button-normal">Normal buttons</H4>
					<p>Use any of the available button style types to quickly create a styled button. Just modify the <code>variant</code> prop.</p>
					<for ${variant in Variant.all}>
						<Button variant=${variant}>${variant}</Button>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.all}>
							<Button variant=${variant}>${variant}</Button>
						</for>
					"}</codeExample>

					<H4 name="button-outline">Outline buttons</H4>
					<p>For a lighter touch, Buttons also come in <code>outline-*</code> variants with no background color.</p>
					<for ${variant in Variant.allOutline}>
						<Button variant=${variant}>${variant}</Button>${" "}
					</for>
					<codeExample>${"
						<for ${variant in Variant.allOutline}>
							<Button variant=${variant}>${variant}</Button>
						</for>
					"}</codeExample>

					<H4 name="button-size">Sizes</H4>
					<p>Fancy larger or smaller buttons? Add <code>size=$${Large}</code>, <code>size=$${Small}</code> for additional sizes.</p>
					<Button size=${Large} variant=${Primary}>Large button</Button>${" "}
					<Button size=${Large} variant=${Secondary}>Large button</Button>${" "}
					<Button size=${Small} variant=${Primary}>Small button</Button>${" "}
					<Button size=${Small} variant=${Secondary}>Small button</Button>${" "}

					<codeExample>${"
						<Button size=${Large} variant=${Primary}>Large button</Button>
						<Button size=${Large} variant=${Secondary}>Large button</Button>
						<Button size=${Small} variant=${Primary}>Small button</Button>
						<Button size=${Small} variant=${Secondary}>Small button</Button>
					"}</codeExample>

					<H4 name="button-disabled">Disabled / Active</H4>
					<Button variant=${Primary} disabled>Disabled button</Button>${" "}
					<Button variant=${Secondary} disabled>Disabled button</Button>${" "}
					<Button variant=${Primary} active>Active button</Button>${" "}
					<Button variant=${Secondary} active>Active button</Button>${" "}

					<codeExample>${"
						<Button variant=${Primary} disabled>Disabled button</Button>
						<Button variant=${Secondary} disabled>Disabled button</Button>
						<Button variant=${Primary} active>Active button</Button>
						<Button variant=${Secondary} active>Active button</Button>
					"}</codeExample>

					<H4 name="button-types">Types</H4>
					<Button href="#">Hyperlink</Button>${" "}
					<Button type=${Submit}>Submit</Button>${" "}
					<Button type=${Reset}>Reset</Button>${" "}
					<Button type=${Input}>Input</Button>${" "}
					<Button type=${Default}>Button</Button>${" "}

					<codeExample>${"
						<Button href='#'>Hyperlink</Button>
						<Button type=${Submit}>Submit</Button>
						<Button type=${Reset}>Reset</Button>
						<Button type=${Input}>Input</Button>
						<Button type=${Default}>Button</Button>
					"}</codeExample>
				</previewSection>

				<H3 name="button-group">ButtonGroup / ButtonToolbar</H3>
				<p class="lead">Group a series of buttons together on a single line with the button group.</p>
				<previewSection>
					<ButtonToolbar ariaLabel="Toolbar with button groups">
						<ButtonGroup className="mr-2" ariaLabel="First group">
							<for ${idx in 1...5}><Button>${Std.string(idx)}</Button>${" "}</for>
						</ButtonGroup>
						<ButtonGroup className="mr-2" ariaLabel="Second group">
							<Button>5</Button> <Button>6</Button> <Button>7</Button>
						</ButtonGroup>
						<ButtonGroup ariaLabel="Third group">
							<Button>8</Button>
						</ButtonGroup>
					</ButtonToolbar>

					<codeExample>${"
						<ButtonToolbar ariaLabel='Toolbar with button groups'>
							<ButtonGroup className='mr-2' ariaLabel='First group'>
								<for ${idx in 1...5}><Button>${Std.string(idx)}</Button></for>
							</ButtonGroup>
							<ButtonGroup className='mr-2' ariaLabel='Second group'>
								<Button>5</Button> <Button>6</Button> <Button>7</Button>
							</ButtonGroup>
							<ButtonGroup ariaLabel='Third group'>
								<Button>8</Button>
							</ButtonGroup>
						</ButtonToolbar>
					"}</codeExample>
				</previewSection>

				<H3 name="card">Card</H3>
				<p class="lead">Bootstrap’s cards provide a flexible and extensible content container with multiple variants and options.</p>
				<previewSection>
					<Card>
						<Card.Header>Card Header</Card.Header>
						<Card.Body>
							<Card.Title>Card Title</Card.Title>
							<Card.Subtitle class="mb-2 text-muted">Card Subtitle</Card.Subtitle>
							<Card.Text>Some quick example text to build on the card title and make up the bulk of the card content.</Card.Text>
							<Card.Link href="#">Card link</Card.Link>
							<Card.Link href="#">Another link</Card.Link>
						</Card.Body>
						<Card.Footer>Card Footer</Card.Footer>
					</Card>
					<codeExample>${"
						<Card>
							<Card.Header>Card Header</Card.Header>
							<Card.Body>
								<Card.Title>Card Title</Card.Title>
								<Card.Subtitle class='mb-2 text-muted'>Card Subtitle</Card.Subtitle>
								<Card.Text>Some quick example text to build on the card title and make up the bulk of the card content.</Card.Text>
								<Card.Link href='#'>Card link</Card.Link>
								<Card.Link href='#'>Another link</Card.Link>
							</Card.Body>
							<Card.Footer>Card Footer</Card.Footer>
						</Card>
					"}</codeExample>
				</previewSection>

				<H3 name="dropdown">Dropdown</H3>
				<p class="lead">Toggle contextual overlays for displaying lists of links and more with the Bootstrap dropdown.</p>
				<previewSection>
					<Dropdown variant=${Success}>
						<caption>Dropdown Button</caption>
						<menu>
							<link url="#/action-1">Action</link>
							<link url="#/action-2">Another action</link>
							<divider />
							<link url="#/action-3">Something else</link>
						</menu>
					</Dropdown>
				</previewSection>


				<H3 name="image">Images</H3>
				<p class="lead">Documentation and examples for opting images into responsive behavior (so they never become larger than their parent elements) and add lightweight styles to them—all via classes.</p>
				<previewSection>
					<H4 name="image-shape">Image shapes</H4>
					<p>Use the <code>rounded</code>, <code>roundedCircle</code> and <code>thumbnail</code> props to customise the image.</p>
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" />${" "}
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" rounded />${" "}
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" roundedCircle />${" "}
					<Image src="https://placekitten.com/150/150" alt="Lorum ipsum" thumbnail />${" "}

					<codeExample>${"
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' />
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' rounded />
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' roundedCircle />
						<Image src='https://placekitten.com/150/150' alt='Lorum ipsum' thumbnail />
					"}</codeExample>

					<H4 name="image-fluid">Fluid image</H4>
					<p>Use the <code>fluid</code> to scale image nicely to the parent element.</p>
					<Image src="https://placekitten.com/1024/400" alt="Lorum ipsum" fluid/>${" "}
					<codeExample>${"
						<Image src='https://placekitten.com/1024/400' alt='Lorum ipsum' fluid />
					"}</codeExample>
				</previewSection>

				<H3 name="jumbotron">Jumbotron</H3>
				<p class="lead">A lightweight, flexible component that can optionally extend the entire viewport to showcase key content on your site.</p>
				<previewSection>
					<Jumbotron>
						<h1>Hello, world!</h1>
						<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
						<p><Button variant=${Primary}>Learn more</Button></p>
					</Jumbotron>
					<codeExample>${"
						<Jumbotron>
							<h1>Hello, world!</h1>
							<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
							<p><Button variant=${Primary}>Learn more</Button></p>
						</Jumbotron>
					"}</codeExample>

					<H4 name="jumbotron-fluid">Fluid jumbotron</H4>
					<p>Use the <code>fluid</code> to make the jumbotron full width, and without rounded corners.</p>
					<Jumbotron fluid>
						<Container>
							<h1>Fluid jumbotron</h1>
							<p>This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
						</Container>
					</Jumbotron>
					<codeExample>${"
						<Jumbotron fluid>
							<Container>
								<h1>Fluid jumbotron</h1>
								<p>This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
							</Container>
						</Jumbotron>
					"}</codeExample>

				</previewSection>

				<H3 name="pagination">Pagination</H3>
				<p class="lead">A lightweight, flexible component that can optionally extend the entire viewport to showcase key content on your site.</p>
				<previewSection>
					<H4 name="pagination-size">Pagination sizes</H4>
					<p>Larger or smaller pagination? Add <code>size=$${Large}</code>, <code>size=$${Small}</code> for additional sizes.</p>
					<Pagination>
						<for ${idx in 1...5}>
							<Pagination.Item active=${idx == 2}>${idx}</Pagination.Item>
						</for>
					</Pagination>
					<Pagination size=${Large}>
						<for ${idx in 1...5}>
							<Pagination.Item active=${idx == 2}>${idx}</Pagination.Item>
						</for>
					</Pagination>
					<Pagination size=${Small}>
						<for ${idx in 1...5}>
							<Pagination.Item active=${idx == 2}>${idx}</Pagination.Item>
						</for>
					</Pagination>
					<codeExample>${"
						<Pagination>
							<for ${idx in 1...5}>
								<Pagination.Item active=${idx == 2}>${idx}</Pagination.Item>
							</for>
						</Pagination>
						<Pagination size=${Large}>
							<for ${idx in 1...5}>
								<Pagination.Item active=${idx == 2}>${idx}</Pagination.Item>
							</for>
						</Pagination>
						<Pagination size=${Small}>
							<for ${idx in 1...5}>
								<Pagination.Item active=${idx == 2}>${idx}</Pagination.Item>
							</for>
						</Pagination>
					"}</codeExample>

					<H4 name="pagination-extra">Pagination helpers</H4>
					<p> For building more complex pagination UI, there are few convenient sub-components for adding
					"First", "Previous", "Next", and "Last" buttons, as well as an Ellipsis item for indicating previous or continuing results.
					</p>
					<Pagination>
						<Pagination.First href="#" />
						<Pagination.Prev href="#"/>
						<Pagination.Item href="#">{1}</Pagination.Item>
						<Pagination.Ellipsis />
						<Pagination.Item href="#">{10}</Pagination.Item>
						<Pagination.Item href="#">{11}</Pagination.Item>
						<Pagination.Item href="#" active>{12}</Pagination.Item>
						<Pagination.Item href="#">{13}</Pagination.Item>
						<Pagination.Item disabled>{14}</Pagination.Item>
						<Pagination.Ellipsis />
						<Pagination.Item href="#">{20}</Pagination.Item>
						<Pagination.Next href="#" />
						<Pagination.Last href="#" />
					</Pagination>
					<codeExample>${"
						<Pagination>
							<Pagination.First href='#' />
							<Pagination.Prev href='#'/>
							<Pagination.Item href='#'>{1}</Pagination.Item>
							<Pagination.Ellipsis />
							<Pagination.Item href='#'>{10}</Pagination.Item>
							<Pagination.Item href='#'>{11}</Pagination.Item>
							<Pagination.Item href='#' active>{12}</Pagination.Item>
							<Pagination.Item href='#'>{13}</Pagination.Item>
							<Pagination.Item disabled>{14}</Pagination.Item>
							<Pagination.Ellipsis />
							<Pagination.Item href='#'>{20}</Pagination.Item>
							<Pagination.Next href='#' />
							<Pagination.Last href='#' />
						</Pagination>
					"}</codeExample>
				</previewSection>


				<H3 name="progress">Progress bars</H3>
				<p class="lead">Provide up-to-date feedback on the progress of a workflow or action with simple yet flexible progress bars.</p>
				<previewSection>
					<H4 name="progress-example">Example</H4>
					<p>Default progress bar. Add a <code>label</code> prop to show a visible percentage. Add a <code>srOnly</code> prop to hide the label visually.
					Add a <code>height</code> prop to give it a different height.</p>
					<let now=${40}>
						<ProgressBar now=${now} label=${'$now%'} className="my-1" />
						<ProgressBar now=${now} label=${'$now%'} srOnly className="my-1" />
						<ProgressBar now=${now} label=${'$now%'} height=${25} className="my-1" />
					</let>
					<codeExample>${"
						<let now=${40}>
							<ProgressBar now=${now} label=${'$now%'} />
							<ProgressBar now=${now} label=${'$now%'} srOnly/>
							<ProgressBar now=${now} label=${'$now%'} height='25' />
						</let>
					"}</codeExample>

					<H4 name="progress-variant">Progress bars variants</H4>
					<p>Progress bars use some of the same button and alert classes for consistent styles.</p>

					<ProgressBar variant=${Success} now=${40} className="my-1" />
					<ProgressBar variant=${Info} now=${20} className="my-1" />
					<ProgressBar variant=${Warning} now=${60} className="my-1" />
					<ProgressBar variant=${Danger} now=${80} className="my-1" />
					<codeExample>${"
						<ProgressBar variant=${Success} now=${40}  />
						<ProgressBar variant=${Info} now=${20} />
						<ProgressBar variant=${Warning} now=${60} />
						<ProgressBar variant=${Danger} now=${80} />
					"}</codeExample>

					<H4 name="progress-variant">Striped / animated progress bars</H4>
					<p>Uses a gradient to create a striped effect.</p>
					<ProgressBar striped variant=${Success} now=${40} className="my-1" />
					<ProgressBar striped variant=${Info} now=${20} className="my-1" />
					<ProgressBar striped animated variant=${Warning} now=${60} className="my-1" />
					<ProgressBar striped animated variant=${Danger} now=${80} className="my-1" />
					<codeExample>${"
						<ProgressBar striped variant=${Success} now=${40}  />
						<ProgressBar striped variant=${Info} now=${20} />
						<ProgressBar striped animated variant=${Warning} now=${60} />
						<ProgressBar striped animated variant=${Danger} now=${80} />
					"}</codeExample>

				</previewSection>
			</Col>
		</Row>
	</Container>
	';

	function viewDidRender():Void {
		// make sure hash in url is used, with this little hack
		var hash = location.hash.substr(1);
		location.hash = "";
		window.setTimeout(() -> location.hash = hash, 0);
	}

	public static function previewSection(attr:{children:Children}) {
		return Bootstrap.create('border rounded p-4 my-3 mb-5 bg-white', attr.children);
	}

	public static function codeExample(attr:{children:String}) {
		var formattedCode:String = js.Syntax.code("window.formatCode({0})", attr.children);
		return hxx('<pre class="border rounded p-4 my-1 mb-3"><code>${formattedCode}</code></pre>');
	}

	public static function H2(attr:{?name:String, children:Children}) '
		<h2 class="mt-3"><if ${attr.name!=null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${...attr.children}</h2>
	';

	public static function H3(attr:{?name:String, children:Children}) '
		<h3 class="mt-3"><if ${attr.name!=null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${...attr.children}</h3>
	';

	public static function H4(attr:{?name:String, children:Children}) '
		<h4 class="mt-3"><if ${attr.name!=null}><a id=${attr.name} href="#${attr.name}">#</a> </if>${...attr.children}</h4>
	';
}
