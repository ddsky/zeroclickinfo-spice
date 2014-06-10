package DDG::Spice::Spoonacular;
# ABSTRACT: Finds delicious recipes on spoonacular.com

use DDG::Spice;

primary_example_queries "popular cheesecake recipes";
secondary_example_queries "cheeseburger with bacon but without gluten";
description "Shows delicious recipes.";
name "spoonacular recipe search";
code_url "https://github.com/ddsky/zeroclickinfo-spice/tree/master/lib/DDG/Spice/Spoonacular.pm";
icon_url "http://spoonacular.com/favicon.ico";
source "spoonacular.com";
topics "food_and_drink";
category "food";
attribution github  => ['https://github.com/ddsky', 'ddsky'],
            twitter => ['https://twitter.com/spoonacular', 'spoonacular'],
            facebook => ['https://facebook.com/spoonacular', 'spoonacular'],
            web =>   ['http://spoonacular.com','spoonacular'],
            email => ['david@spoonacular.com','David Urbansky'];

spice to => 'http://46.4.89.232:8080/recipes/searchFromApp?query=$1&number=18&username={{ENV{DDG_SPICE_SPOONACULAR_APIKEY}}}';

spice wrap_jsonp_callback => 1;

# cache every 200 or 304 response for 3 days
spice proxy_cache_valid => "200 304 3d";

# a list of dishes and the word recipe to trigger the search
my @triggers = ( 'recipe', 'recipes', 'rice crispy treat', 'rice krispy treat', 'rice krispy treats', 'rice krispies treat', 'rice krispies treats', 'rice crispies treat', 'rice crispies treats', 'rice krispie', 'cheesecake factorys chicken madeira', 'chicken madeira from cheesecake factory', 'chicken madeira from the cheesecake f', 'homemade sunflower seed butter', 'diy sunbutter', 'diy sunflower seed butter', 'make your own sunbutter', 'make your own sunflower seed butter', 'sunbutter from scra', 'cheesecake factorys louisiana chicken pasta', 'louisiana chicken pasta from the cheesecake factory', 'louisiana chicken pasta from cheesecake factory', 'cheese', 'homemade chocolate hazelnut spread', 'diy nutella', 'diy chocolate hazelnut spread', 'make your own nutella', 'make your own chocolate hazelnut spread', 'nutella fro', 'filled pepper', 'stuffed peppers', 'filled peppers', 'stuffed bell pepper', 'filled bell pepper', 'stuffed bell peppers', 'filled bell peppers', 'madeleines', 'madeleine cookie', 'madeleine cookies', 'madeleine cake', 'madeleine cakes', 'french butter cake', 'french butter cakes', 'toasted cheese', 'grilled cheese sandwich', 'toasted cheese sandwich', 'grilled cheese sandwiches', 'toasted cheese sandwiches', 'icecream sandwiches', 'ice cream sandwiches', 'ice-cream sandwich', 'icecream sandwich', 'ice cream sandwich', 'proscuitto wrapped chile shrimp', 'proscuitto wrapped chile shrimp', 'proscuitto wrapped shrimp', 'hot dog bun', 'hotdog buns', 'hot dog buns', 'hot dog roll', 'hot dog rolls', 'hotdog roll', 'hot dog rolls', 'shepherd?s pie', 'shepherds pie', 'shepherd pie', 'shepards pie', 'shepard pie', 'ice cream cakes', 'icecream cake', 'icecream cakes', 'ice-cream cake', 'ice-cream cakes', 'diy cashew butter', 'make your own cashew butter', 'cashew butter from scratch', 'diy almond butter', 'make your own almond butter', 'almond butter from scratch', 'diy peanut butter', 'make your own peanut butter', 'peanut butter from scratch', 'roasted brussels sprouts', 'roasted brussel sprouts', 'roasted brussel sprout', 'stir frys', 'stir fries', 'stirfry', 'stirfries', 'stirfrys', 'stir-fry', 'stir-fries', 'tuna melts', 'tuna melt on english muffins', 'tuna melt on english muffin', 'grilled sausages', 'grilled bratwursts', 'grilled bratwurst', 'grilled brats', 'buffalo wing sauce', 'buffalo wings sauce', 'buffalo chicken sauce', 'no bake cheesecake', 'no bake cheesecakes', 'no-bake cheesecakes', 'rice crispy cakes', 'rice krispies cakes', 'rice crispies cakes', 'buffalo wings', 'buffalo chicken wing', 'buffalo chicken wings', 'burgers', 'hamburgers', 'cheeseburgers', 'hamburger', 'cheeseburger', 'tartlets', 'tartlette', 'tartelette', 'tartlettes', 'tartelettes', 'hamburgers', 'cheeseburger', 'cheeseburgers', 'burger', 'burgers', 'fishcakes', 'fish patties', 'fish patty', 'fishcake', 'fish cake', 'croque monsieur sandwich', 'croque monsieur sandwiches', 'breakfast casseroles', 'breakfast bake', 'breakfast bakes', 'turkey meatballs', 'turkey meat ball', 'turkey meat balls', 'cupcake lasagna', 'cupcake lasagne', 'cupcake lasagnes', 'angelfood cake', 'angelfood cakes', 'angel food cakes', 'easy phyllo pastry tarts with hot pepper jelly', 'no bake cookie', 'no-bake cookies', 'no bake cookies', 'cream filled brioche', 'brioche filled with cream', 'milk shake', 'milkshakes', 'milk shakes', 'shake', 'shakes', 'kebabs', 'kabob', 'kabobs', 'kebap', 'kebaps', 'kabab', 'kababs', 'hamburger buns', 'hamburger roll', 'hamburger rolls', 'egg casseroles', 'eggs casserole', 'eggs casseroles', 'cheesecake factorys louisiana chicken pasta', 'roast turkeys', 'roasted turkey', 'roasted turkeys', 'chow mein clusters', 'chow mein noodle cookies', 'brunch casseroles', 'brunch bake', 'brunch bakes', 'heros', 'heroes', 'hero sandwich', 'hero sandwiches', 'cinnamon rolls', 'cinnamon bun', 'cinnamon buns', 'omelette roll', 'omelette rolls', 'omelet rolls', 'no bake cake', 'no bake cakes', 'no-bake cakes', 'pasta with zucchini and squash blossoms', 'salmon patties', 'salmon cake', 'salmon patty', 'sunny-side-up eggs', 'fried egg', 'fried eggs', 'blueberries in black pepper-syrah syrup', 'oysters breaded with bacon and parsley', 'homemade croutons', 'corn muffin croutons', 'carrot cake with cream cheese frosting', 'bliny', 'russian pancake', 'russian pancakes', 'no bake pie', 'no-bake pies', 'no bake pies', 'pears with blue cheese and proscuitto', 'pasta with zucchini & squash blossoms', 'rib eye steak', 'rib eyes', 'rib eye steaks', 'seafood boil', 'lobster boil', 'prawn boil', 'burger buns', 'burger roll', 'burger rolls', 'hamburger casserole', 'burger casserole', 'oven fried chicken', 'ovenfried chicken', 'hungarian pancake', 'hungarian pancakes', 'overnight oatmeal', 'overnight porridge', 'coffeecake', 'coffeecakes', 'coffee cakes', 'prawn vermicelli', 'shrimp vermicelli', 'cheesecake factory chicken madeira', 'crescent rolls', 'crescent', 'crescents', 'subs', 'sub sandwich', 'sub sandwiches', 'tater tot', 'potato tot', 'potato tots', 'cheese dogs', 'cheesedog', 'cheesedogs', 'pound cakes', 'poundcake', 'poundcakes', 'bread, bean, and vegetable soup', 'spiked apple cider', 'spiked cider', 'pestos', 'pesto sauce', 'pesto sauces', 'proscuitto-wrapped chile shrimp', 'beef olives', 'roulade', 'beef olive', 'rice cake stack', 'ricecake stack', 'thumbprint cookies', 'thumbprints', 'chocolate covered strawberries', 'meat balls', 'meatballs', 'meat ball', 'scallops wrapped with pancetta', 'mac n cheese', 'macaroni n cheese', 'cream puff', 'cream puffs', 'choux ', 'corncake', 'corncakes', 'corn cakes', 'crab cakes', 'crabcake', 'crabcakes', 'sauteed brussels sprouts', 'saut', 'latke', 'latkes', 'potato pancakes', 'macaroni and cheese cupcakes', 'cheeseburgers', 'burger', 'burgers', 'pita bread', 'pitas', 'pita breads', 'homemade tomato-garlic paste', 'fritatta', 'frittatas', 'fritattas', 'bear claw', 'bearclaw', 'bearclaws', 'pastry pillow', 'pillow', 'pillows', 'chocolate covered strawberry', 'shrimp wrapped with pancetta', 'chocolate chip coffee cakes', 'pastry for single-crust pie', 'chicken and mustard crumble', 'pizza pie', 'pizzas', 'pizza pies', 'cranberry upside down cakes', 'pastry for double-crust pie', 'spaghetti and meatball cake', 'zucchini ricotta cheesecake', 'macaroni and cheese cupcake', 'horseradish mashed potatoes', 'pastry for double pie-crust', 'pineapple upside down cakes', 'banana chocolate chip cakes', 'turnip greens and ham hocks', 'omelette', 'omelets', 'omelettes', 'mediterranean pasta salads', 'chocolate chip cheesecakes', 'pineapple upside down cake', 'chocolate chip coffee cake', 'banana chocolate chip cake', 'cranberry upside down cake', 'stuffed heirloom tomatoes', 'black bean and corn salad', 'pulled chicken sandwiches', 'corn and black bean salad', 'bread machine pizza dough', 'thai chicken spring rolls', 'horseradish mashed potato', 'flourless chocolate cakes', 'hot cake', 'hotcakes', 'hotcake', 'doughnuts', 'doughnut', 'donuts', 'mediterranean pasta salad', 'chocolate zucchini breads', 'chocolate chip cheesecake', 'oatmeal cranberry cookies', 'bread machine pizza crust', 'baked brie in puff pastry', 'mediterranean tuna salads', 'cheesy broccoli potatoes', 'chocolate zucchini bread', 'mediterranean tuna salad', 'chocolate zucchini cakes', 'proscuitto wrapped melon', 'spaghetti alla carbonara', 'strawberry frozen yogurt', 'lobster-avocado cocktail', 'cranberry pumpkin breads', 'kale chips', 'kale crisps', 'proscuitto-wrapped melon', 'flourless chocolate cake', 'vanilla ricotta souffles', 'caramel-dipped hazelnuts', 'cranberry-orange muffins', 'roasted butternut squash', 'oatmeal cranberry cookie', 'salmon with waffle glaze', 'bread and butter pickles', 'prosciutto-stuffed figs', 'roasted brussels sprout', 'zucchini-scallion cakes', 'pulled chicken sandwich', 'chocolate zucchini cake', 'rice flour pastry crust', 'potpie', 'potpies', 'pot pies', 'sweet potato casseroles', 'butterflied leg of lamb', 'cranberry pumpkin bread', 'oatmeal crusted tilapia', 'hotdog', 'hotdogs', 'hot dogs', 'roasted root vegetables', 'cream of asparagus soup', 'perogies', 'pierogi', 'perogi', 'cranberry orange muffin', 'oatmeal crusted chicken', 'spinach and ricotta pie', 'miniature cheeseburgers', 'corned beef and cabbage', 'bubble and squeak cakes', 'proscuitto stuffed figs', 'slushie', 'slushy', 'slushies', 'bread and butter pickle', 'rice flour pastry dough', 'molten chocolate cakes', 'grilled sweet potatoes', 'roasted root vegetable', 'french toast casserole', 'homemade cashew butter', 'strawberry cheesecakes', 'bubble and squeak cake', 'cheeseburger casserole', 'homemade peanut butter', 'stuffed turkey breasts', 'oatmeal raisin cookies', 'cream of broccoli soup', 'candied sweet potatoes', 'miniature cheeseburger', 'baked brussels sprouts', 'homemade almond butter', 'sticky toffee puddings', 'chocolate chip muffins', 'sweet and sour chicken', 'bread and tomato salad', 'homemade soft pretzels', 'chocolate chip cookies', 'german chocolate cakes', 'puff pastry pretzels', 'spiked hot apple cider', 'tuna noodle casseroles', 'pulled pork sandwiches', 'sweet potato casserole', 'tuna noodle casserole', 'homemade soft pretzel', 'sticky toffee pudding', 'peanut butter muffins', 'grapefruit in moscato', 'oatmeal baked chicken', 'chocolate chip cookie', 'fragrant orange curry', 'vegetable meat loaf', 'pumpkin bread pudding', 'strawberry shortcakes', 'german chocolate cake', 'chicken and dumplings', 'smoked salmon spreads', 'molten chocolate cake', 'cheesy broccoli soups', 'spinach artichoke dip', 'peanut butter cookies', 'bread turkey stuffing', 'streusel coffee cakes', 'chocolate cheesecakes', 'spice mix', 'spice blend', 'chinese chicken salad', 'strawberry cheesecake', 'stuffed acorn squashs', 'morning glory muffins', 'chocolate stout cakes', 'mashed sweet potatoes', 'noodle', 'noodles', 'pastas', 'crab-coconut cocktail', 'green bean casseroles', 'chocolate chip muffin', 'oatmeal raisin cookie', 'green bean casserole', 'cheesy broccoli soup', 'chocolate cheesecake', 'fried chicken livers', 'boiling water pastry', 'strawberry shortcake', 'candied sweet potato', 'chocolate cream pies', 'puff pastry pretzels', 'key lime cheesecakes', 'new york cheesecakes', 'bread & tomato salad', 'sweet and sour sauce', 'mississippi mud pies', 'apple pie on a stick', 'chocolate pecan pies', 'peanut butter cookie', 'refrigerator pickles', 'strawberry ice cream', 'simple turnip greens', 'homemade almond milk', 'ice-cream sandwiches', 'smoked salmon spread', 'gingerbread biscotti', 'spaghetti puttanesca', 'eggs n bacon cupcake', 'chocolate chip cakes', 'figs with proscuitto', 'miniature hamburgers', 'cheesecake nut crust', 'honey-glazed carrots', 'chocolate stout cake', 'italian wedding soup', 'grilled sweet potato', 'stuffed strawberries', 'peanut butter muffin', 'hamburger stroganoff', 'fresh strawberry pie', 'cream-filled brioche', 'pulled pork sandwich', 'cheese stuffed dates', 'chocolate croissants', 'black-eyed pea salad', 'orange chiffon cakes', 'chicken caesar salad', 'streusel coffee cake', 'cheese-stuffed dates', 'fried green tomatoes', 'gingerbread pancakes', 'honey whipped butter', 'carrot cake pancakes', 'butterscotch pudding', 'morning glory muffin', 'vegetable fried rice', 'stuffed acorn squash', 'buttermilk biscuits', 'corn bread dressing', 'mississippi mud pie', 'red velvet cupcakes', 'spaghetti bolognese', 'broccoli casseroles', 'buffalo chicken dip', 'gingerbread cookies', 'sugared cranberries', 'gruyere puff pastry', 'braised lamb shanks', 'carrot cake muffins', 'fried chicken liver', 'orange chiffon cake', 'filled strawberries', 'sweet potato salads', 'breakfast casserole', 'macaroni and cheese', 'miniature hamburger', 'chocolate croissant', 'vegetarian meatloaf', 'chicken noodle soup', 'cucumber bruschetta', 'key lime cheesecake', 'sweet and sour pork', 'coconut layer cakes', 'puff pastry chicken', 'chicken cordon bleu', 'hasselback potatoes', 'chocolate pecan pie', 'mashed sweet potato', 'strawberry icecream', 'gingerbread waffles', 'peanut butter bites', 'caramel apple cakes', 'gingerbread pancake', 'grilled corn salads', 'chocolate cream pie', 'braised red cabbage', 'carrot cake pancake', 'pop-tarts', 'pop tarts', 'roasted cauliflower', 'chocolate ice cream', 'cake frosting/icing', 'puff pastry squares', 'bacon wrapped dates', 'honey-glazed carrot', 'peanut butter balls', 'bacon-wrapped dates', 'tofu vegetable loaf', 'angels on horseback', 'french bread pizzas', 'cheesy garlic bread', 'chocolate chip cake', 'lemon meringue pies', 'hamburger seasoning', 'spaghetti carbonara', 'eggplant parmigiana', 'devils on horseback', 'new york cheesecake', 'scalloped potatoes', 'cornbread skillets', 'cranberry chutneys', 'crash hot potatoes', 'chocolate souffles', 'sunny side up eggs', 'gingerbread scones', 'peppermint patties', 'horseradish sauces', 'fettuccine alfredo', 'chili cheese fries', 'coconut layer cake', 'buttermilk biscuit', 'no-bake cheesecake', 'tomato crumble pie', 'gingerbread people', 'grilled fish tacos', 'sweet potato salad', 'roasted vegetables', 'braised short ribs', 'mini cheeseburgers', 'peanut butter pies', 'boston brown bread', 'rice crispy treats', 'stuffed pork chops', 'figs w/ proscuitto', 'chocolate icecream', 'summer corn salads', 'bread crusted fish', 'red velvet cupcake', 'simple swiss chard', 'puff pastry square', 'caramel apple cake', 'cheeseburger pizza', 'homemade sunbutter', 'stuffed artichokes', 'smoked salmon dips', 'stir-fried chicken', 'turtle cheesecakes', 'pierogie casserole', 'roasted beet salad', 'lemon meringue pie', 'arroz con gandules', 'red velvet cookies', 'breakfast burritos', 'sweet potato fries', 'puff pastry salmon', 'braised lamb shank', 'rice krispie cakes', 'cornbread dressing', 'oven-fried chicken', 'rotisserie chicken', 'carrot cake muffin', 'caramelized onions', 'gingerbread waffle', 'eggnog pound cakes', 'hot and sour soups', 'chocolate cupcakes', 'cornbread stuffing', 'grilled corn salad', 'bread-crusted fish', 'gingerbread cookie', 'devils food cakes', 'broccoli casserole', 'french bread pizza', 'chicken fried rice', 'cauliflower steaks', 'fried green tomato', 'pigs in a blanket', 'cornbread chicken', 'thumbprint cookie', 'turkey tetrazzini', 'curry powder trio', 'horseradish sauce', 'sweet potato pies', 'cranberry chicken', 'vanilla ice cream', 'cupcake pork pies', 'chocolate cupcake', 'eggplant parmesan', 'skillet cornbread', 'mozzarella sticks', 'cornbread skillet', 'stuffed pork chop', 'mini cheeseburger', 'sourdough starter', 'roasted chickpeas', 'chocolate pudding', 'tamale casseroles', 'chow mein cookies', 'grilled pineapple', 'black forest cake', 'cauliflower puree', 'shortcrust pastry', 'eggnog pound cake', 'zucchini pancakes', 'breakfast cookies', 'cheeseburger soup', 'perogie casserole', 'gingerbread cakes', 'stuffed mushrooms', 'turtle cheesecake', 'yorkshire pudding', 'boston cream pies', 'roasted chestnuts', 'italian drip beef', 'baked potato soup', 'cheeseburger cake', 'apple pie filling', 'caramelized onion', 'mexican spice mix', 'breakfast burrito', 'summer corn salad', 'french onion soup', 'zucchini fritters', 'grilled asparagus', 'smoked salmon dip', 'banana cream pies', 'infused olive oil', 'bun tom heo nuong', 'rotisserie turkey', 'red velvet cookie', 'blackened catfish', 'hot artichoke dip', 'cauliflower steak', 'puff pastry bites', 'roasted vegetable', 'watermelon salads', 'homemade nut milk', 'choucroute garnie', 'pistachio pudding', 'chocolate fondues', 'grilled fish taco', 'gingerbread scone', 'tuna pasta salads', 'french toast bake', 'chocolate souffle', 'stuffed artichoke', 'homemade soy milk', 'tres leches cakes', 'apple pie topping', 'hot and sour soup', 'pan-fried chicken', 'peanut butter pie', 'cranberry chutney', 'grilled zucchinis', 'cheeseburger pies', 'cupcake meat loaf', 'miniature burgers', 'puff pastry tarts', 'whole wheat bread', 'stuffed zucchinis', 'roasted asparagus', 'foccaccia', 'focacia', 'unstuffed cabbage', 'hot chocolate mix', 'strawberry butter', 'barbecue potatoes', 'roasted hazelnuts', 'hasselback potato', 'ice cream topping', 'bubble and squeak', 'cheeseburger mac', 'smashed potatoes', 'icecream topping', 'stuffed zucchini', 'mozzarella stick', 'breakfast cookie', 'clementine cakes', 'cauliflower rice', 'cupcake pork pie', 'chicken normandy', 'oatmeal chippers', 'sour dough bread', 'choucroute garni', 'gingerbread cake', 'cherry clafoutis', 'beef bourguignon', 'hash brown cakes', 'boston cream pie', 'grasshopper pies', 'cornbread salads', 'cranberry breads', 'watermelon salad', 'chicken tandoori', 'irish soda bread', 'coffee ice cream', 'seafood cocktail', 'roasted broccoli', 'flat bread pizza', 'red velvet cakes', 'dutch apple pies', 'breakfast pizzas', 'roasted potatoes', 'tres leches cake', 'puff pastry tart', 'applesauce cakes', 'cranberry sauces', 'grilled zucchini', 'pasta puttanesca', 'homemade nutella', 'banana cream pie', 'lobster cocktail', 'cupcake meatloaf', 'zucchini pancake', 'thai beef salads', 'sweet potato pie', 'rice paper rolls', 'tamale casserole', 'cherries jubliee', 'coconut cupcakes', 'brunch casserole', 'cookies-in-a-jar', 'sausage crumbles', 'baked potato bar', 'strawberry froyo', 'miniature burger', 'cupcake lasagnas', 'zucchini fritter', 'vanilla icecream', 'moroccan chicken', 'crash hot potato', 'chicken marbella', 'streusel muffins', 'california rolls', 'tuna pasta salad', 'cheeseburger pie', 'jalapeno poppers', 'peppermint patty', 'cowboy cornbread', 'portable caprese', 'beer can chicken', 'burger seasoning', 'cauliflower soup', 'shrimp and grits', 'normandy chicken', 'chocolate fondue', 'huevos rancheros', 'roasted soy nuts', 'kung pao chicken', 'grasshoppier pie', 'homemade ketchup', 'chorizo crumbles', 'stuffed mushroom', 'tandoori chicken', 'black bean salad', 'vanilla cupcakes', 'puff pastry cups', 'puff pastry eggs', 'caprese skewers', 'burrito filling', 'chicken tenders', 'apple pie spice', 'german pancakes', 'cucumber salads', 'blueberry cakes', 'clementine cake', 'pasta carbonara', 'mashed potatoes', 'rice-cake stack', 'mini hamburgers', 'sausage crumble', 'roasted almonds', 'pork fried rice', 'shrimp cocktail', 'cranberry sauce', 'puff pastry cup', 'spaghetti sauce', 'salmon chowders', 'chocolate sauce', 'vanilla cookies', 'turkey meatloaf', 'quiche lorraine', 'cranberry bread', 'vanilla cupcake', 'salad dressings', 'skillet lasagne', 'oatmeal chipper', 'hot fudge sauce', 'beef wellington', 'buffalo chicken', 'antipasto salad', 'cornbread salad', 'croque monsieur', 'banana puddings', 'jalapeno popper', 'lemon asparagus', 'applesauce cake', 'coconut cupcake', 'flatbread pizza', 'cherry clafouti', 'sourdough bread', 'waffle potatoes', 'rice paper roll', 'cornish pasties', 'creamed spinach', 'tamale pot pies', 'thai beef salad', 'turkey meatball', 'black eyed peas', 'dutch apple pie', 'oatmeal cookies', 'arroz con pollo', 'pasta bolognese', 'roasted peanuts', 'vegetable soups', 'chicken marsala', 'tuna casseroles', 'apple tart-tini', 'buns', 'roll', 'rolls', 'streusel muffin', 'pasta primavera', 'tomato chutneys', 'black bean soup', 'steak au poivre', 'teriyaki salmon', 'christmas cakes', 'gingerbread men', 'bolognese sauce', 'egg yolk pastry', 'macaroni salads', 'corn bread hash', 'beef stroganoff', 'english muffins', 'zucchini breads', 'corn bread bake', 'grilled sausage', 'crumble oatmeal', 'breakfast pizza', 'vanilla pudding', 'pasta e fagioli', 'broccoli salads', 'tropical teaser', 'skillet lasagna', 'chicken piccata', 'baja fish tacos', 'chocolate cakes', 'pretzel turtles', 'chorizo crumble', 'sugared peanuts', 'tennessee peach', 'jelly', 'marmalade', 'red velvet cake', 'lo scintillante', 'vegetable stews', 'homemade catsup', 'angel food cake', 'chicken curries', 'pumpkin butter', 'tortilla soups', 'cocktail salad', 'bananas foster', 'grilled salmon', 'no-bake cookie', 'turkey gravies', 'asian coleslaw', 'oatmeal cookie', 'spinach salads', 'waldorf salads', 'cream of wheat', 'tamale pot pie', 'turkey burgers', 'grilled cheese', 'shepherds pie', 'cucumber salad', 'linzer cookies', 'salad croutons', 'roast potatoes', 'chex party mix', 'roast chickens', 'ice cream cake', 'taco seasoning', 'white cupcakes', 'cornbread bake', 'potato pancake', 'pumpkin loaves', 'banana pudding', 'corpse reviver', 'glazed carrots', 'chocolate cake', 'caramel apples', 'spaghetti pies', 'boiled peanuts', 'salmon chowder', 'marinara sauce', 'chicken chilli', 'bread stuffing', 'roasted garlic', 'meat ball soup', 'vegan meatloaf', 'baked potatoes', 'brunswick stew', 'tuna casserole', 'orange chicken', 'bakewell tarts', 'bread puddings', 'paninis', 'panino', 'tomato chutney', 'vanilla cookie', 'blueberry cake', 'broccoli salad', 'vegetable stew', 'chicken salads', 'fruit cocktail', 'ginger cookies', 'chickpea salad', 'overnight oats', 'collard greens', 'sesame chicken', 'barbecue sauce', 'peanut chicken', 'baja fish taco', 'two-bite pizza', 'broccoli slaws', 'salmon burgers', 'hot cross buns', 'stuffed pepper', 'pumpkin breads', 'prawn cocktail', 'cornbread hash', 'rice and beans', 'vegetable soup', 'beef turnovers', 'english muffin', 'cornbread pies', 'smoked chicken', 'christmas cake', 'pastry pillows', 'fish and chips', 'cocktail sauce', 'butter chicken', 'macaroni salad', 'beans and rice', 'taco casserole', 'tea sandwiches', 'pudding treats', 'mexican coffee', 'scrambled eggs', 'pb & h extreme', 'armadillo eggs', 'cashew chicken', 'mini hamburger', 'blooming onion', 'zucchini bread', 'salad dressing', 'pecan pie bars', 'chocolate roll', 'baked tilapia', 'lettuce wraps', 'salmon salads', 'crescent roll', 'spinach salad', 'bread pudding', 'seasoning mix', 'black pudding', 'caramel cakes', 'hamburger bun', 'cheese souffl', 'french toasts', 'pink lemonade', 'coconut cakes', 'sausage rolls', 'banoffee pies', 'carrot souffl', 'crab cocktail', 'hot chocolate', 'vanilla cakes', 'linzer cookie', 'tortilla soup', 'chicken curry', 'strudel dough', 'pickled beets', 'abm', 'abm', 'mushroom soup', 'banana breads', 'roast chicken', 'turkey burger', 'artichoke dip', 'popcorn balls', 'clam chowders', 'pudding treat', 'broccoli slaw', 'pepper sherry', 'pudding cakes', 'faux meatloaf', 'chicken soups', 'grilled bread', 'white cupcake', 'pumpkin rolls', 'sugar cookies', 'baba ghanoush', 'colored sugar', 'egg casserole', 'alfredo sauce', 'fried chicken', 'salsa chicken', 'waldorf salad', 'pumpkin bread', 'bread machine', 'lobster rolls', 'scrambled egg', 'cornish pasty', 'grilled fruit', 'roasted beets', 'lemon pudding', 'chilis salsa', 'corn chowders', 'beef turnover', 'risotto cakes', 'stuffed dates', 'bakewell tart', 'cornbread pie', 'lentil salads', 'lettuce rolls', 'avocado rolls', 'glazed carrot', 'chicken chili', 'spaghetti pie', 'normandy pork', 'eggs benedict', 'mashed potato', 'chicken salad', 'garlic confit', 'cinnamon roll', 'summer breeze', 'oatmeal bread', 'hot cross bun', 'broccoli rabe', 'pecan pie bar', 'salmon burger', 'pork shoulder', 'fish chowders', 'caramel apple', 'frozen yogurt', 'meatball soup', 'potato salads', 'burrito bowls', 'chicken wings', 'cabbage rolls', 'ginger cookie', 'semmelknoedel', 'roll', 'bun', 'buns', 'lemon cookies', 'duck pancakes', 'buffalo sauce', 'caramel sauce', 'key lime pies', 'bacon poppers', 'soft pretzels', 'pork normandy', 'shrimp scampi', 'bouillabaisse', 'pastry shells', 'pico de gallo', 'potato salad', 'beurre blanc', 'banana cakes', 'roast garlic', 'italian beef', 'pumpkin pies', 'cosmopolitan', 'crumble cake', 'lentil salad', 'tomato sauce', 'salmon salad', 'steamed buns', 'white chilli', 'pudding pies', 'fruit salads', 'spiked cider', 'pastry cream', 'apple butter', 'caramel corn', 'schweinshaxe', 'banana bread', 'new potatoes', 'honey butter', 'candied yams', 'fish chowder', 'tea sandwich', 'cheese rolls', 'deviled eggs', 'greek salads', 'key lime pie', 'monkey bread', 'baked salmon', 'berry nectar', 'profiteroles', 'shish kebabs', 'crumble bars', 'clam chowder', 'summer rolls', 'burrito meat', 'pasta salads', 'marble cakes', 'french toast', 'pizza crisps', 'corn chowder', 'stuffed figs', 'caramel cake', 'roast turkey', 'whoopie pies', 'date squares', 'lentil soups', 'carrot cakes', 'lettuce wrap', 'oyster stews', 'shrimp cakes', 'spring rolls', 'sausage roll', 'potato chips', 'chicken soup', 'risotto cake', 'irish coffee', 'tomato soups', 'tartar sauce', 'soft pretzel', 'no-bake cake', 'hoppin john', 'bean burgers', 'burrito bowl', 'short pastry', 'quick breads', 'oatmeal cake', 'caesar salad', 'salmon cakes', 'mini burgers', 'potato cakes', 'pastry shell', 'coconut cake', 'pumpkin roll', 'granola bars', 'carne asadas', 'buttered rum', 'saffron rice', 'avocado roll', 'bread salads', 'vinaigrettes', 'curry powder', 'cheeseburger', 'waffle fries', 'baked apples', 'pastry dough', 'buffalo wing', 'figs stuffed', 'wet burritos', 'protein bars', 'mexican rice', 'turkey gravy', 'sugar cookie', 'duck pancake', 'bbq potatoes', 'vanilla cake', 'pudding cake', 'roasted nuts', 'cabbage roll', 'french fries', 'lobster roll', 'pumpkin loaf', 'italian ices', 'banoffee pie', 'wrapped figs', 'grain salads', 'fried livers', 'sponge cakes', 'agua frescas', 'cake filling', 'fried turkey', 'pizza sauces', 'baked potato', 'corn pudding', 'cupcake pops', 'potato bread', 'beer chicken', 'pastry crust', 'burrito bake', 'potato skins', 'garlic bread', 'turkey chili', 'chili powder', 'jerk chicken', 'lemon cookie', 'coconut rice', 'poached eggs', 'oatmeal bars', 'tarte tatins', 'cookies n cr', 'cheese bread', 'wet burrito', 'onion rings', 'pizza bites', 'carrot cake', 'quick bread', 'burrito pie', 'bagna cauda', 'puff pastry', 'brown sauce', 'corn salads', 'vinaigrette', 'deviled egg', 'iced coffee', 'monkeybread', 'apricot jam', 'pizza sauce', 'quesadillas', 'protein bar', 'bloody mary', 'summer roll', 'magic shell', 'baked beans', 'cereal milk', 'oatmeal pie', 'pasta salad', 'shrimp cake', 'almond milk', 'cherry pies', 'salsa verde', 'greek salad', 'spinach dip', 'bun cha gio', 'bagel chips', 'tarte tatin', 'carne asada', 'wonton soup', 'lentil loaf', 'bean burger', 'cupcake pop', 'cheese roll', 'granola bar', 'omelet roll', 'oatmeal bar', 'fruit salad', 'spring roll', 'italian ice', 'oyster stew', 'mini burger', 'ratatouille', 'pearl balls', 'baked apple', 'bread soups', 'pizza rolls', 'apple cakes', 'white cakes', 'dipping oil', 'bundt cakes', 'lamb shanks', 'steamed bun', 'tuna salads', 'coffee cake', 'cookie cake', 'pudding pie', 'pate brisee', 'spelt bread', 'date square', 'poached egg', 'cookie bars', 'potato soup', 'white chili', 'pumpkin pie', 'pizza crust', 'gingerbread', 'crumble pie', 'taco salads', 'shrimp boil', 'rice pilafs', 'agua fresca', 'petit fours', 'cheesecakes', 'potato cake', 'tamale pies', 'fried okras', 'infused oil', 'whoopie pie', 'breadsticks', 'quickbreads', 'panna cotta', 'mexican rub', 'fried liver', 'potato skin', 'sponge cake', 'bread salad', 'bun mang ga', 'pizza crisp', 'no-bake pie', 'sloppy joes', 'crumb cakes', 'sushi rolls', 'sachertorte', 'lentil soup', 'tomato soup', 'pig knuckle', 'candied yam', 'sauerbraten', 'corn breads', 'pulled pork', 'pizza dough', 'pie filling', 'banana cake', 'duck confit', 'toffee bars', 'shish kebab', 'pigeon pies', 'marble cake', 'grain salad', 'spanakopita', 'spice cakes', 'pasta sauce', 'lemon bars', 'bean salad', 'egg salads', 'hotdog bun', 'fried tofu', 'baked kale', 'beer bread', 'pound cake', 'cheesecake', 'egg pastry', 'pecan pies', 'apple pies', 'bruschetta', 'dirty rice', 'pigeon pie', 'palacsinta', 'easter ham', 'lamingtons', 'bagel chip', 'cookie mix', 'pasta bake', 'fried rice', 'spice cake', 'rice pilaf', 'tamale pie', 'prime ribs', 'pots de cr', 'bundt cake', 'fish cakes', 'pizza roll', 'coq au vin', 'tortellini', 'pork chops', 'taco salad', 'sloppy joe', 'muffin mix', 'croissants', 'kale chips', 'pie crusts', 'bean balls', 'burger mac', 'toffee bar', 'cassoulets', 'fried okra', 'cheese dog', 'fish tacos', 'pimms cup', 'tuna salad', 'bread soup', 'roast lamb', 'tater tots', 'minestrone', 'baked eggs', 'petit four', 'bear claws', 'lamb chops', 'corn salad', 'cornbreads', 'beet salad', 'onion tart', 'soda bread', 'crumb cake', 'quesadilla', 'king cakes', 'panettones', 'cookie bar', 'rye breads', 'casseroles', 'cheese dip', 'baked ziti', 'sandwiches', 'white cake', 'quickbread', 'cobb salad', 'sushi roll', 'cream roll', 'onion ring', 'apple cake', 'margaritas', 'burger bun', 'fish stock', 'cherry pie', 'baked brie', 'corn bread', 'enchiladas', 'gazpachos', 'osso buco', 'cocktails', 'bun dough', 'colcannon', 'milkshake', 'rye bread', 'pastichio', 'pot de cr', 'dressings', 'tiramisus', 'tabbouleh', 'corn dogs', 'cake pops', 'pot roast', 'rum cakes', 'pie dough', 'whole ham', 'lemon bar', 'smoothies', 'panettone', 'meat loaf', 'tuna melt', 'tortelini', 'lamington', 'michelada', 'flapjacks', 'kalimotxo', 'hamburger', 'pork buns', 'baked egg', 'sparklers', 'pie crust', 'shakshuka', 'crab cake', 'yule logs', 'hot cakes', 'madeleine', 'cavatelli', 'empanadas', 'hand pies', 'ice cream', 'porridges', 'cornbread', 'marinades', 'chow mein', 'roll cake', 'pierogies', 'ciabattas', 'consommes', 'prime rib', 'cassoulet', 'corn cake', 'spritzers', 'turnovers', 'pastitsio', 'antipasto', 'croissant', 'fish bake', 'egg bread', 'bbq sauce', 'ribollita', 'taco meat', 'pork chop', 'apple pie', 'baguettes', 'scotchies', 'caponatas', 'fish taco', 'rum balls', 'casserole', 'king cake', 'margarita', 'trail mix', 'date bars', 'ice cubes', 'enchilada', 'green tea', 'cake roll', 'roast ham', 'flour mix', 'bolognese', 'fresh ham', 'rillettes', 'pissaladi', 'queso dip', 'quenchers', 'guacamole', 'egg salad', 'pecan pie', 'salty dog', 'beef stew', 'daiquiris', 'cake shot', 'frosting', 'meatball', 'strudels', 'icecream', 'gnocchis', 'palmiers', 'chippers', 'cut outs', 'smoothie', 'crostini', 'spritzer', 'ciabatta', 'tzatziki', 'yule log', 'fig jams', 'cut-outs', 'empanada', 'cake pop', 'caponata', 'fritters', 'burritos', 'roll-ups', 'cocktail', 'crumbles', 'crudites', 'potroast', 'corn dog', 'cupcakes', 'schnecke', 'rouladen', 'prosecco', 'focaccia', 'risottos', 'cake mix', 'frittata', 'gazpacho', 'cioppino', 'flapjack', 'rum cake', 'ossobuco', 'tartines', 'sandwich', 'marinade', 'porridge', 'moussaka', 'martinis', 'ice pops', 'schnapps', 'sangrias', 'biscuits', 'dressing', 'calzones', 'pop corn', 'tiramisu', 'turnover', 'custards', 'soup mix', 'nut milk', 'macarons', 'pork bun', 'benedict', 'meatloaf', 'rum ball', 'truffles', 'pretzels', 'chex mix', 'spaetzle', 'souffles', 'bellinis', 'granitas', 'shooters', 'sparkler', 'handpies', 'stuffing', 'coleslaw', 'minestra', 'stir fry', 'tabouleh', 'kedgeree', 'pastries', 'baguette', 'poptarts', 'cobblers', 'quencher', 'chutneys', 'brownies', 'puddings', 'pad thai', 'cannolis', 'rugelach', 'pancakes', 'consomme', 'crackers', 'chowders', 'soy milk', 'scotchie', 'tostadas', 'daiquiri', 'fajitas', 'mussels', 'chowder', 'lasagna', 'tartine', 'pakoras', 'souffle', 'sliders', 'cookies', 'martini', 'one-pot', 'macaron', 'pavlova', 'palmier', 'compote', 'one pot', 'ravioli', 'stollen', 'brittle', 'candies', 'trifles', 'wontons', 'mojitos', 'buckles', 'waffles', 'fritter', 'sangria', 'pot pie', 'baklava', 'egg nog', 'negroni', 'smores', 'chutney', 'muffins', 'oatmeal', 'gratins', 'brisket', 'tzaziki', 'gnocchi', 'tartini', 'custard', 'strudel', 'cannoli', 'eclairs', 'bellini', 'cobbler', 'sorbets', 'crumble', 'canapes', 'chipper', 'tagines', 'popcorn', 'cracker', 'chicken', 'hot dog', 'kloesse', 'granola', 'calzone', 'pretzel', 'yoghurt', 'churros', 'leather', 'pancake', 'brioche', 'ketchup', 'spreads', 'borscht', 'risotto', 'lasagne', 'burrito', 'polenta', 'shooter', 'granita', 'biryani', 'tartlet', 'tiramis', 'samosas', 'curries', 'rib eye', 'fig jam', 'crudite', 'quiches', 'pudding', 'cupcake', 'floats', 'relish', 'trifle', 'bagels', 'chilli', 'burger', 'toasts', 'treats', 'tonics', 'steaks', 'catsup', 'crepes', 'fudges', 'sorbet', 'rumaki', 'churro', 'mousse', 'pastry', 'canape', 'turkey', 'sauces', 'bisque', 'scones', 'wonton', 'quiche', 'pakora', 'eggnog', 'omelet', 'buckle', 'fajita', 'nachos', 'spread', 'yogurt', 'cooler', 'mojito', 'hummus', 'gratin', 'slider', 'muffin', 'gumbos', 'paella', 'coffee', 'samosa', 'cookie', 'tagine', 'eclair', 'pilafs', 'muesli', 'salads', 'waffle', 'smores', 'batter', 'panini', 'breads', 'kimchi', 'drinks', 'rolls', 'kebab', 'float', 'kraut', 'sauce', 'bread', 'cakes', 'fudge', 'punch', 'melts', 'babka', 'tarts', 'shots', 'goose', 'slush', 'pizza', 'korma', 'chili', 'drink', 'toast', 'blini', 'stock', 'salad', 'gravy', 'bagel', 'soups', 'pasta', 'penne', 'treat', 'musli', 'raita', 'tonic', 'salsa', 'candy', 'fries', 'juice', 'crack', 'gumbo', 'stews', 'pilaf', 'crisp', 'donut', 'lassi', 'atole', 'mocha', 'curry', 'pesto', 'froyo', 'icing', 'scone', 'steak', 'cider', 'tacos', 'wraps', 'fish', 'wrap', 'pops', 'shot', 'cake', 'melt', 'duck', 'oils', 'bars', 'saut', 'stew', 'pate', 'bark', 'taco', 'beef', 'pita', 'tart', 'dogs', 'dips', 'pies', 'hero', 'pide', 'naan', 'soup', 'mash', 'slaw', 'dog', 'jam', 'tea', 'ham', 'pie', 'dip' );

triggers any => @triggers;

handle query_lc => sub {
	my $q = $_;
	$q =~ s/best/popular/;
	return $q if $q;
	return;
};

1;