import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FancyInputComponent } from './components/fancy-input/fancy-input.component';
import { IonicModule } from '@ionic/angular';
import { SliderComponent } from './components/slider/slider.component';
import { ModalComponent } from './components/modal/modal.component';
import { MenuStartComponent } from './utils/menu-start/menu-start.component';
import { MainSliderComponent } from './utils/main-slider/main-slider.component';
import { MapComponent } from './utils/map/map.component';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { StarsComponent } from './utils/stars/stars.component';
import { StarsAverageComponent } from './utils/stars-average/stars-average.component';
import { FilteredCategoriesComponent } from './utils/filtered-categories/filtered-categories.component';
import { MdlFilterComponent } from './utils/filtered-categories/mdl-filter/mdl-filter.component';
import { CalendarComponent } from './utils/calendar/calendar.component';


@NgModule({
  declarations: [
    FancyInputComponent,
    SliderComponent,
    ModalComponent,
    MenuStartComponent,
    MainSliderComponent,
    MapComponent,
    StarsComponent,
    StarsAverageComponent,
    FilteredCategoriesComponent,
    MdlFilterComponent,
    CalendarComponent
  ],
  imports: [ 
    CommonModule,
    IonicModule.forRoot(),
  ],
  exports : [
    FancyInputComponent,
    SliderComponent,
    ModalComponent,
    MenuStartComponent,
    MainSliderComponent,
    MapComponent,
    StarsComponent,
    StarsAverageComponent,
    FilteredCategoriesComponent,
    CalendarComponent
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class SharedModule { }