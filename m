From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/2] x86: gpio: AMD G-Series pch gpio platform driver
Date: Fri, 08 Feb 2019 09:47:16 -0800
Message-ID: <dfd0101f4a596600e2f0f8cf36886cf01c7dcb67.camel@perches.com>
References: <1549588593-4856-1-git-send-email-lkml@metux.net>
         <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaSEZMR7LuLbO1V0k9QEBu4FWxFbq4ZL1pE9dAvNT1z_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, 2019-02-08 at 15:25 +0100, Linus Walleij wrote:
> > +/*
> > + * GPIO driver for the AMD G series FCH (eg. GX-412TC)
> > + *
> > + * Copyright (C) 2018 metux IT consult
> > + * Author: Enrico Weigelt <info@metux.net>
> > + *
> > + * SPDX-License-Identifier: GPL+
> > + */
> 
> I think checkpatch will complain on that SPDX thing.
> Copy something from one of the other drivers, it should be
> on the first line of the file.

Actually, checkpatch will complain that there isn't
an SPDX license on line 1 but will not complain about
the existence of an SPDX license on other line numbers.

Perhaps checkpatch _should_ complain when it sees an
SPDX license identifier outside the expected line.
