module build;

version(build) 
{
	version(Windows)
		pragma(target, "dui.lib");
	version(linux)
		pragma(target, "libdui.a");
	// Do not link this file in
	pragma(nolink);
}

import dango.All;
import dango.Context;
import dango.Font;
import dango.Layout;
import dango.TabArray;

import ddi.Bitmap;
import ddi.Color;
import ddi.Cursor;
import ddi.Display;
import ddi.Drawable;
import ddi.GC;
import ddi.KeySyms;
import ddi.Pixbuf;
import ddi.Pixmap;
import ddi.Screen;
import ddi.Value;
import ddi.Visual;
import ddi.WindowG;

import def.Types;
import def.Constants;

import dglib.AQueue;
import dglib.ErrorG;
import dglib.File;
import dglib.IOChannel;
import dglib.Plugin;
import dglib.Spawn;
import dglib.SpawnException;
import dglib.StringG;
import dglib.ThreadG;
import dglib.TimerG;

version(linux) 
{
	import dui.Plug; 
	import dui.Socket;
}

import dui.All;
import dui.AccelGroup;
import dui.AccelLabel;
import dui.Adjustment;
import dui.Alignment;
import dui.Arrow;
import dui.AspectFrame;
import dui.Box;
import dui.Button;
import dui.ButtonBox;
import dui.Calendar;
import dui.CellRenderer;
import dui.CellRendererPixbuf;
import dui.CellRendererText;
import dui.CellRendererToggle;
import dui.CheckButton;
import dui.CheckMenuItem;
import dui.ColorSelection;
import dui.ColorSelectionDialog;
import dui.Combo;
import dui.ComboBox;
import dui.ComboBoxText;
import dui.ComboBoxTextEntry;
import dui.Curve;
import dui.DUI;
import dui.DUIObject;
import dui.Dialog;
import dui.DrawingArea;
import dui.Editable;
import dui.Entry;
import dui.EventBox;
import dui.FileSelection;
import dui.FileChooserDialog;
import dui.Fixed;
import dui.FontSelection;
import dui.FontSelectionDialog;
import dui.Frame;
import dui.GammaCurve;
import dui.HBox;
import dui.HButtonBox;
import dui.HPaned;
import dui.HRuler;
import dui.HScale;
import dui.HScrollbar;
import dui.HSeparator;
import dui.HandleBox;
import dui.Image;
import dui.ImageMenuItem;
import dui.InputDialog;
import dui.Invisible;
import dui.Item;
import dui.ItemFactory;
import dui.Label;
import dui.Layout;
import dui.ListG;
import dui.ListStore;
import dui.MainWindow;
import dui.Menu;
import dui.MenuBar;
import dui.MenuItem;
import dui.MenuShell;
import dui.MessageDialog;
import dui.Misc;
import dui.Notebook;
import dui.ObjectG;
import dui.OptionMenu;
import dui.Paned;
import dui.PopupBox;
import dui.Preview;
import dui.ProgressBar;
import dui.RadioButton;
import dui.RadioMenuItem;
import dui.Range;
import dui.Ruler;
import dui.SListG;
import dui.Scale;
import dui.Scrollbar;
import dui.ScrolledWindow;
import dui.Separator;
import dui.SeparatorMenuItem;
import dui.SpinButton;
import dui.Statusbar;
import dui.Table;
import dui.TearoffMenuItem;
import dui.TextChildAnchor;
import dui.TextTag;
import dui.TextTagTable;
import dui.TextIter;
import dui.TextMark;
import dui.TextBuffer;
import dui.TextView;
import dui.ToggleButton;
import dui.Toolbar;
import dui.Tooltips;
import dui.Tree;
import dui.TreeItem;
import dui.TreeIter;
import dui.TreeModel;
import dui.TreePath;
import dui.TreeRowReference;
import dui.TreeStore;
import dui.TreeView;
import dui.TreeViewColumn;
import dui.TreeSelection;
import dui.Utils;
import dui.VBox;
import dui.VButtonBox;
import dui.VPaned;
import dui.VRuler;
import dui.VScale;
import dui.VScrollbar;
import dui.VSeparator;
import dui.Viewport;
import dui.Widget;
import dui.List;
import dui.ListItem;
import dui.Clipboard;
import dui.Selection;
import dui.DND;
import dui.OGTK;
import dui.WindowGroup;
import dui.SizeGroup;

import event.All;
import event.Dispatcher;
import event.Event;
import event.ButtonListener;
import event.ContainerListener;
import event.DUIObjectListener;
import event.MenuItemListener;
import event.NotebookListener;
import event.WidgetListener;
import event.WindowListener;
import event.CalendarListener;
import event.EditableListener;
import event.EntryListener;
import event.TextListener;
import event.MenuShellListener;
import event.ToolbarListener;
import event.ColorSelectionListener;
import event.ItemListener;
import event.HandleBoxListener;
import event.ToggleButtonListener;
import event.CheckMenuItemListener;
import event.StatusbarListener;
import event.AdjustmentListener;
import event.TreeModelListener;
import event.IdleListener;
import event.TimeoutListener;
import event.TreeViewListener;
import event.CellListener;
import event.SelectionListener;
import event.TextListener;

import ggl.All;
import ggl.Types;
import ggl.GL;
import ggl.GLArea;
import ggl.GLCapability;
import ggl.GLConfig;
import ggl.GLContext;
import ggl.GLDraw;
import ggl.GLDrawable;
import ggl.GLFont;
import ggl.GLPixmap;
import ggl.GLWidget;
import ggl.GLWindow;
version(linux)
	import ggl.GLX11;

import lib.gdk;
import lib.gdkglext;
import lib.glib;
import lib.gmodule;
import lib.gobject;
import lib.gtk;
import lib.pango;
import lib.paths;
import lib.Loader;
import lib.gl;
import lib.glu;
import lib.glext;
