From: Vinson Lee <vlee@freedesktop.org>
Subject: =?UTF-8?Q?linux=2Dnext_build_error_=22pinctrl=2Dbaytrail=2Ec=3A413=3A_erro?=
	=?UTF-8?Q?r=3A_unknown_field_=E2=80=98simple=5Ffuncs=E2=80=99_specified_in_initializer?=
	=?UTF-8?Q?=22?=
Date: Wed, 11 May 2016 12:10:00 -0700
Message-ID: <CACKvgLEUymqJy_-ado6gQqR_RK7h2LdYc7ZvZb3rDoepCSuEcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f193.google.com ([209.85.213.193]:36810 "EHLO
	mail-ig0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932072AbcEKTKk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 15:10:40 -0400
Received: by mail-ig0-f193.google.com with SMTP id c3so4931693igl.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 12:10:40 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Cristina Ciocan <cristina.ciocan@intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi.

I am hitting this build failure on linux-next with GCC 4.4 introduced
with commit c8f5c4c7c82c9 "pinctrl: baytrail: Add pin control data
structures".

  CC      drivers/pinctrl/intel/pinctrl-baytrail.o
drivers/pinctrl/intel/pinctrl-baytrail.c:413: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:413: warning: missing braces
around initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:413: warning: (near
initialization for =E2=80=98byt_score_groups[0].<anonymous>=E2=80=99)
drivers/pinctrl/intel/pinctrl-baytrail.c:415: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:417: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:419: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:421: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:423: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:425: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:427: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:429: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:431: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:433: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:435: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:437: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:439: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:441: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:443: error: unknown field
=E2=80=98mixed_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:443: warning: initialization
from incompatible pointer type
drivers/pinctrl/intel/pinctrl-baytrail.c:445: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:447: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:449: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:451: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:453: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:455: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:457: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:459: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:461: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:463: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:465: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:618: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:618: warning: missing braces
around initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:618: warning: (near
initialization for =E2=80=98byt_sus_groups[0].<anonymous>=E2=80=99)
drivers/pinctrl/intel/pinctrl-baytrail.c:620: error: unknown field
=E2=80=98mixed_funcs=E2=80=99 specified in initializer
drivers/pinctrl/intel/pinctrl-baytrail.c:620: warning: initialization
from incompatible pointer type
drivers/pinctrl/intel/pinctrl-baytrail.c:622: error: unknown field
=E2=80=98simple_funcs=E2=80=99 specified in initializer

Cheers,
Vinson
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
