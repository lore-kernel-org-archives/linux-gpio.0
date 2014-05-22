From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [RFC PATCH 1/2] gpiolib: allow simultaneous setting of multiple
 GPIO outputs
Date: Thu, 22 May 2014 18:50:12 +0200
Message-ID: <20140522165012.GO22644@book.gsilab.sittig.org>
References: <1883250.Le7v5oGnod@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:59773 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbaEVQuP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 May 2014 12:50:15 -0400
Content-Disposition: inline
In-Reply-To: <1883250.Le7v5oGnod@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

Regarding the subject:  Should you not flag this as "another
iteration" (v2 or something) since there already was a submission
for this very feature (2014-01-23)?  Reviewers may want to look
up the previous version, and see whether you addressed feedback
that was provided so far.

On Wed, 2014-05-21 at 14:58 +0200, Rojhalat Ibrahim wrote:
> 
> This patch introduces a new function gpiod_set_raw_array to the consumer
> interface which allows setting multiple outputs with just one function call.
> It also adds an optional set_multiple function to the driver interface.
> 
> Multiple GPIOs are represented by an array of descriptors. The values to be
> set are stored in an integer array. Example:
> 
> 	struct gpio_desc *desc_array[10];
> 	int value_array[10];
> 
> 	... acquire descriptors ...
> 	... set values in value_array ...
> 
> 	gpiod_set_raw_array(10, desc_array, value_array);

It's nice that you provide this information, but could this not
better be done in a text file which is kept in the Documentation
part of the source tree?  This would live longer and be more
apparent to fellow developers than the commit message, and would
cut down on the commit message.  After all you do introduce a new
and non-trivial feature.

> Benefits:
> 	- Uses descriptor interface. GPIOs have to be acquired before use.
> 	- Allows arbitrary groups of GPIOs spanning multiple chips.
> 	- Works without adjustments in GPIO chip drivers.
> 	- Implementing the new set_multiple function in a chip driver results in
> 	  additional benefits:
> 		* Improved performance for certain use cases. The original motivation for
> 		  this was the task of configuring an FPGA. In that specific case, where
> 		  9 GPIO lines have to be set many times, configuration time goes down from
> 		  48 s to 19 s when using the new function.
> 		* Simultaneous glitch-free setting of multiple pins on any kind of parallel
> 		  bus attached to GPIOs.

Note that the glitch-free setting of multiple pins is only
available if all the pins reside in the same bank of one specific
chip that implements the set_multiple feature.  Given how generic
the GPIO API is (users need not care which banks the pins are on,
whether they are different types of chips, how the chips are
connected to the CPU (think expanders), or what their respective
drivers' feature sets are), there may be more involved than just
implementing the set_multiple function.

Style nit:  Please check your commit messages for appropriate
line lengths.

> Limitations:
> 	- Performance is only improved for normal high-low outputs. Open drain and
> 	  open source outputs are always set separately from each other. Those kinds
> 	  of outputs could probably be accelerated in a similar way if we could forgo
> 	  the error checking when setting GPIO directions.
> 	- There is no gpiod_set_array function that regards the ACTIVE_LOW bits.
> 	  The _raw_ function should be sufficient for many use cases. So I avoided
> 	  the code duplication the other functions would require.

Have you considered the implications of running this new feature
on a board which has multiple GPIO chips of different types,
where the use case involves arbitrary pins of these chips to "run
the bus protocol"?


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
