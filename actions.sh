# user defined menu and action array(s)
# should start with 'menu_a' and 'action_a'
menu_a=('Item One' 'Item Two' 'Submenu b')
action_a=('action_one' 'action_two' 'action_submenu b')

menu_b=('Item Four' 'Submenu c' 'Go back')
action_b=('action_four' 'action_submenu c' 'action_goback')

menu_c=('Item Seven' 'Item Eight' 'Go back')
action_c=('action_seven' 'action_eight' 'action_goback')

# user defined action function(s)
action_one() {
    printf "Action One\n"
}

action_two() {
    printf "Action Two\n"
}

action_three() {
    printf "Action Three\n"
}

action_four() {
    printf "Action Four\n"
}

action_seven() {
    printf "Action Seven\n"
}

action_eight() {
    printf "Action Eight\n"
}
