all: plot1.R plot2.R plot3.R plot4.R

plot1.R : source/load_data.R source/plot1.R source/plot1_core.R
	cat > plot1.R source/load_data.R
	cat >> plot1.R source/plot1_core.R
	sed >> plot1.R -e/source/d source/plot1.R

plot2.R : source/load_data.R source/plot2.R source/plot2_core.R
	cat > plot2.R source/load_data.R
	cat >> plot2.R source/plot2_core.R
	sed >> plot2.R -e/source/d source/plot2.R

plot3.R : source/load_data.R source/plot1.R source/plot1_core.R
	cat > plot3.R source/load_data.R
	cat >> plot3.R source/plot3_core.R
	sed >> plot3.R -e/source/d source/plot3.R

plot4.R : source/load_data.R source/plot4.R source/plot2_core.R source/plot3_core.R source/plot4_core.R
	cat > plot4.R source/load_data.R
	cat >> plot4.R source/plot2_core.R
	cat >> plot4.R source/plot3_core.R
	cat >> plot4.R source/plot4_core.R
	sed >> plot4.R -e/source/d source/plot4.R
