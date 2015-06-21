/**
 ******************************************************************************
 * @file    delay_hal_stm32f2xx.h
 * @author  Matthew McGowan
 * @version V1.0.0
 * @date    25-Sept-2014
 * @brief
 ******************************************************************************
  Copyright (c) 2013-2015 Particle Industries, Inc.  All rights reserved.

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation, either
  version 3 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************
 */

#ifndef DELAY_HAL_STM32F2XX_H
#define	DELAY_HAL_STM32F2XX_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

    void HAL_Delay_Microseconds(uint32_t micros);


#ifdef	__cplusplus
}
#endif

#endif	/* DELAY_HAL_STM32F2XX_H */
