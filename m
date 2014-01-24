From: Gerhard Sittig <gsi@denx.de>
Subject: Re: [RFC PATCH] gpiolib: introduce gpio_set_multiple function
Date: Fri, 24 Jan 2014 13:36:55 +0100
Message-ID: <20140124123655.GW20094@book.gsilab.sittig.org>
References: <2473803.SebQ52F62q@pcimr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:35463 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbaAXMhC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2014 07:37:02 -0500
Content-Disposition: inline
In-Reply-To: <2473803.SebQ52F62q@pcimr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rojhalat Ibrahim <imr@rtschenk.de>
Cc: linux-gpio@vger.kernel.org, Roland Stigge <stigge@antcom.de>

[ added Cc: to Roland Stigge ]

On Thu, Jan 23, 2014 at 13:19 +0100, Rojhalat Ibrahim wrote:
> 
> This patch introduces a new function gpio_set_multiple which allows setting
> multiple GPIO lines on the same chip with just one function call. If a
> corresponding set_multi function is defined for the chip performance can be
> significantly improved. Otherwise gpio_set_multiple uses the chip's set
> function and the performance stays the same as without the new function.
> For my application, where I have to frequently set 9 GPIO lines in order to
> configure an FPGA, configuration time goes down from 48 s to 15 s when I use
> this new function. (Tested with a modified gpio-mpc8xxx module.)

It's worth noting that performance is not the only concern, it
may be even more important to avoid glitches when adjusting the
levels of multiple pins which form some kind of bus (think
"parport").  Improved throughput may just be a byproduct.  How
you see it depends on your use case.

ISTR that Roland suggested some "block GPIO" approach in the
past, work on it has continued for quite long a period of time.
Apparently it has not yet gone into mainline, as the subject is
more complex than one might expect at first glance.

There are several concerns that need to get addressed in the
design, before an implementation could follow:
- do you want to restrict the use for groups of pins which all
  reside on the same chip?
- do you expect callers to know or make sure that these
  constraints are met?
- do you want to operate in a "best effort" manner, or will you
  reject requests that cannot get serviced "at the same time"?
  (see above, what is the motivation or use case?)

Current implementation of the Linux GPIO subsystem suggests
- that callers don't expect gpio_set_value() could ever fail
- that callers need not care, and should not care, which specific
  pin they are controlling, as long as they get a handle to it

Which suggests that the best effort approach would be most
appropriate:  Allow callers to specify any arbitrary group of
pins and which values to drive to them, try to process the
request with as few glitches as possible, still transparently
adjust individual pins and/or individual banks if nothing better
is available.  This results in
- callers still not caring about how the pins are attached in
  hardware (configuration is not encoded but data driven these
  days)
- best possible performance, automatically taking benefit from
  optional support for advanced features
- gpio chip drivers can get adjusted as they want to, or remain
  as they are and still keep working
- glitch free signal adjustment in "bus style" for those setups
  where the pins reside on the same bank and the chip driver
  supports parallel manipulation -- it's under control of the
  board designers whether they need or want this feature

None of the above says anything about the implementation, whether
a "parallel" code path is required to communicate multi-pin
set-operations, or whether some kind of "prepare and commit"
transaction style gets implemented (and what to do about
concurrent requests then).


There is not much one could say about your specific patch, as it
only introduces one callback for a GPIO chip, while it neither
provides an example implementation within a driver nor provides
an example caller demonstrating how the API is meant to get used,
and completely lacks any kind of documentation.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
