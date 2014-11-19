From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Fix enable/disable/mask/unmask
Date: Wed, 19 Nov 2014 10:48:28 -0800
Message-ID: <CAD=FV=XVyM2Fgf9nWr4+Do7DCLJ6WW2N9DGYs+Qbxtvd+WkYOA@mail.gmail.com>
References: <1416354596-15013-1-git-send-email-dianders@chromium.org>
	<1416354596-15013-3-git-send-email-dianders@chromium.org>
	<CAD=FV=W3oQjEJLo4vYoTOwv38iKNT0MHQ9qPSWBm=qFMTnHKag@mail.gmail.com>
	<1437548.SPtpsDgD8I@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:38006 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736AbaKSSs3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Nov 2014 13:48:29 -0500
Received: by mail-oi0-f45.google.com with SMTP id a141so864512oig.4
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2014 10:48:29 -0800 (PST)
In-Reply-To: <1437548.SPtpsDgD8I@diego>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sonny Rao <sonnyrao@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Chris Zhong <zyw@rock-chips.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Heiko,

On Wed, Nov 19, 2014 at 10:46 AM, Heiko St=C3=BCbner <heiko@sntech.de> =
wrote:
> Am Mittwoch, 19. November 2014, 09:54:13 schrieb Doug Anderson:
>> Hi,
>>
>> On Tue, Nov 18, 2014 at 3:49 PM, Doug Anderson <dianders@chromium.or=
g>
> wrote:
>> > +static void rockchip_irq_disable(struct irq_data *d)
>> > +{
>> > +       struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data=
(d);
>> > +       u32 val;
>> > +
>> > +       irq_gc_lock(gc);
>> > +       val =3D irq_reg_readl(gc, GPIO_INTEN);
>> > +       irq_reg_writel(gc, val & ~d->mask, GPIO_INTEN);
>> > +       irq_gc_unlock(gc);
>> > +}
>>
>> Off list, Dmitry asked me why I didn't use irq_gc_mask_disable_reg()
>> and irq_gc_unmask_enable_reg() (AKA why I coded up my own function
>> here).  Originally I tried to use irq_gc_mask_disable_reg() and
>> irq_gc_unmask_enable_reg().  ..but they're really not designed to wo=
rk
>> in tandem with the irq_gc_mask_set_bit() and irq_gc_mask_clr_bit().
>>
>> Specifically if you try to use one set of functions for your
>> mask/unmask and the other for your disable/enable you'll find that
>> they stomp on each other.  Both functions upkeep the exact same
>> "mask_cache" variable.
>>
>> Personally I'm totally baffled by how irq_gc_mask_disable_reg() and
>> irq_gc_unmask_enable_reg() could actually be sane, but that's maybe =
a
>> topic for another discussion.
>
> I don't think irq_gc_mask_disable_reg and irq_gc_unmask_enable_reg ar=
e meant
> as callbacks for irq_enable/irq_disable. As the name implies they are
> standardized callbacks for irq_mask/irq_unmask on machines using a di=
fferent
> scheme for masking. So I would expected that they operate on the same
> mask_cache because both types of functions handle masking on differen=
t types of
> interrupt controllers.

Agreed that they aren't meant for irq_enable / irq_disable and that
it's not a bug.  It was just so tempting to use them and Dmitry
wondered the same thing, so I wrote an email detailing this.  Even
though these aren't for use as enable/disable, I will point out that
they don't seem sane (to me) for masking...


> There don't seem to be any generalized callbacks for irq_enable/irq_d=
isable
> themself, probably because machines do the most uncommon things there=
 :-)

=46air enough.  If it becomes common someone can move my functions
somewhere common.  ;)


Do you think this patch is something that should land?  Do I need to
prove that it's useful before we actually land it?  Right now I just
posted it because it seemed better, not because it fixes anything that
I know of.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
