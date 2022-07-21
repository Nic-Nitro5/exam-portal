<?php
class Color{
    public function get_color()){
        return $color;
    }

    public function use_color(){
        return $color_used;
    }
}

$colors = new Color();

// $colors would have access to get_color() and use_color()

$color->get_color();