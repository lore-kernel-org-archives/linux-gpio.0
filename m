From: "Ciocan, Cristina" <cristina.ciocan@intel.com>
Subject: =?Windows-1252?Q?RE:_linux-next_build_error_"pinctrl-baytrail.c:413:_erro?=
 =?Windows-1252?Q?r:_unknown_field_=91simple=5Ffuncs=92_specified_in_initi?=
 =?Windows-1252?Q?alizer"?=
Date: Thu, 12 May 2016 11:15:53 +0000
Message-ID: <2C20774B5D61C44889C8C95089C8E3322DD8DA54@irsmsx105.ger.corp.intel.com>
References: <CACKvgLEUymqJy_-ado6gQqR_RK7h2LdYc7ZvZb3rDoepCSuEcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=Windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:29547 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752577AbcELLbf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 May 2016 07:31:35 -0400
In-Reply-To: <CACKvgLEUymqJy_-ado6gQqR_RK7h2LdYc7ZvZb3rDoepCSuEcw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vinson Lee <vlee@freedesktop.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello,

This seems to be a GCC bug that has been fixed in versions 4.6+.

Regards,
Cristina
________________________________________
=46rom: vinsonl@gmail.com [vinsonl@gmail.com] on behalf of Vinson Lee [=
vlee@freedesktop.org]
Sent: Wednesday, May 11, 2016 10:10 PM
To: Mika Westerberg; Heikki Krogerus; Ciocan, Cristina; Linus Walleij
Cc: linux-gpio@vger.kernel.org
Subject: linux-next build error "pinctrl-baytrail.c:413: error: unknown=
 field =91simple_funcs=92 specified in initializer"

Hi.

I am hitting this build failure on linux-next with GCC 4.4 introduced
with commit c8f5c4c7c82c9 "pinctrl: baytrail: Add pin control data
structures".

  CC      drivers/pinctrl/intel/pinctrl-baytrail.o
drivers/pinctrl/intel/pinctrl-baytrail.c:413: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:413: warning: missing braces
around initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:413: warning: (near
initialization for =91byt_score_groups[0].<anonymous>=92)
drivers/pinctrl/intel/pinctrl-baytrail.c:415: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:417: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:419: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:421: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:423: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:425: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:427: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:429: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:431: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:433: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:435: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:437: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:439: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:441: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:443: error: unknown field
=91mixed_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:443: warning: initialization
from incompatible pointer type
drivers/pinctrl/intel/pinctrl-baytrail.c:445: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:447: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:449: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:451: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:453: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:455: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:457: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:459: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:461: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:463: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:465: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:618: error: unknown field
=91simple_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:618: warning: missing braces
around initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:618: warning: (near
initialization for =91byt_sus_groups[0].<anonymous>=92)
drivers/pinctrl/intel/pinctrl-baytrail.c:620: error: unknown field
=91mixed_funcs=92 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:620: warning: initialization
from incompatible pointer type
drivers/pinctrl/intel/pinctrl-baytrail.c:622: error: unknown field
=91simple_funcs=92 specified in initializer

Cheers,
Vinson
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
