$fn=32;

module front_holder()
{
    screwhole_diameter = 4.5;
    screw_padding = 2;
    height = 30;
    depth=20;
    control_holder_depth = 40;
    control_holder_offset = 18;
    thickness=3;
    top_width = screw_padding*2+screwhole_diameter+thickness;

    difference()
    {
        union () 
        {
            //Vertical plate
            cube ([height, depth, thickness]);

            //Top holding part
            cube ([thickness, depth,top_width]);

            //Control horn holder
            translate([control_holder_offset, 0, 0])
            cube ([thickness, control_holder_depth, top_width]);
        }

        //Wheel hole
        translate([height - screw_padding - screwhole_diameter/2, depth/2, -1])
        cylinder (h=thickness+2, d=screwhole_diameter);

        //Mounting hole
        translate([-1, depth/2, top_width - screwhole_diameter/2-screw_padding])
        rotate(90, [0,1,0])
        cylinder (h=thickness+2, d=screwhole_diameter);

        //Control hole
        translate([
                -1 + control_holder_offset, 
                control_holder_depth - screw_padding -screwhole_diameter / 2, 
                top_width - screwhole_diameter/2-screw_padding
            ])
        rotate(90, [0,1,0])
        cylinder (h=thickness+2, d=screwhole_diameter);
    }
}

front_holder();
