From: Tony Lindgren <tony@atomide.com>
Subject: Re: pinctrl-sx150x.c broken in 4.11
Date: Thu, 11 May 2017 08:16:47 -0700
Message-ID: <20170511151647.GT3489@atomide.com>
References: <04424bd9-daba-e803-23ce-e7604bf41c71@cogentembedded.com>
 <CACRpkdaVpOw+PbocW+wwy5kDp8Ud=Xow_+gnAhJ+eFWTLob7LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaVpOw+PbocW+wwy5kDp8Ud=Xow_+gnAhJ+eFWTLob7LQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <Chris.Healy@zii.aero>, Jeff White <Jeff.White@zii.aero>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [170511 00:26]:
> On Wed, May 10, 2017 at 9:32 PM, Nikita Yushchenko
> <nikita.yoush@cogentembedded.com> wrote:
> 
> > Looks like recent pinctrl changes - possibly commit 99e4f67508e1
> > ("pinctrl: core: Use delayed work for hogs") - breaks pinctrl-sx150x
> > driver in all setups where it has any pinctrl settings in device tree.
> >
> > AFAIU, pinctrl-sx150x is not a real pinctrl/pinmux driver,
> 
> It's as real as it gets.
> 
> > but it uses
> > pinctrl subsystem to provide control over GPIO lines it provides.  But
> > for user, it is just a i2c-gpio device that is enabled via device tree,
> > and, like other devices, can have pinctrl-0 that points to "real" pinmux
> > configuration for involved hardware lines (i.e. line used for interrupt).
> >
> > Problem is that when pinctrl-sx150x driver registers itself via
> > pinctrl_register(), pinctrl map that corresponds to pinctrl-0 property
> > of sx150x device tree node, is misinterpreted as hog.  Corresponding
> > call chain is
> >
> >   pinctrl_enable() ->
> >     pinctrl_claim_hogs() ->
> >       create_pinctrl()
> >
> > at this point, registered pinctrl maps are scanned and matched by device
> > name only, without checking map's control device. Then map is passed to
> > add_setting() with pctldev set to sx150x which does not provide
> > pinmux_ops, which errors out:
> >
> > sx150x-pinctrl 10-0020: does not support mux function
> > sx150x-pinctrl 10-0020: could not map pin config for "VF610_PAD_PTB1"
> > sx150x-pinctrl 10-0020: error claiming hogs: -22
> > sx150x-pinctrl 10-0020: could not claim hogs: -22
> > sx150x-pinctrl 10-0020: Failed to register pinctrl device
> > sx150x-pinctrl: probe of 10-0020 failed with error -22
> >
> > Before commit 99e4f67508e1 ("pinctrl: core: Use delayed work for hogs")
> > problem was hidden by not passing pinctrl device to add_setting(), but
> > instead getting that from map.
> >
> > What is proper fix for this?
> 
> I bet Tony has the answer to this.
> 
> I think something similar to:
> commit 6118714275f0a313ecc296a87ed1af32d9691bed
> "pinctrl: core: Fix pinctrl_register_and_init() with pinctrl_enable()"
> is needed?

Hmm maybe yeah. I don't quite follow the above the "pinctrl-0 property
of sx150x device tree node, is misinterpreted as hog" part though.

But at least with updating the probe to use pinctrl_register_and_init()
and pinctrl_enable() the driver can do something before the hogs are
claimed. I just don't know what the driver would here as I don't
understand the "misinterpreted as hog" part :)

Anyways, care to test if the following patch fixes the issue somehow?
And also maybe try to see what is missing in the REVISIT part of
the patch.. Compile tested only.

Hmm maybe the driver can claim pinctrl-0 before the hogs are claimed
then release it after the hogs are claimed? Just guessing though.

> Maybe we need to go over everything in drivers/pinctrl and check that
> we don't have more of these broken hogs.

It would be probably best to update all the drivers to probe with
pinctrl_register_and_init() with pinctrl_enable() as otherwise we'll
never know where the issue is going to pop up again. Right now all
it might take is configuring hogs for a driver in dts.. Anybody
know coccinelle?

But let's first figure out what exactly is the problem here.

Regards,

Tony

8< ----------------------
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1225,13 +1225,16 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->pinctrl_desc.npins = pctl->data->npins;
 	pctl->pinctrl_desc.owner = THIS_MODULE;
 
-	pctl->pctldev = pinctrl_register(&pctl->pinctrl_desc, dev, pctl);
-	if (IS_ERR(pctl->pctldev)) {
-		dev_err(dev, "Failed to register pinctrl device\n");
-		return PTR_ERR(pctl->pctldev);
+	ret = pinctrl_register_and_init(&pctl->pinctrl_desc, dev,
+					pctl, &pctl->pctldev);
+	if (ret) {
+		dev_err(dev, "Failed to register pinctrl\n");
+		return ret;
 	}
 
-	return 0;
+	/* REVISIT: Do something with pinctrl-0 misinterpreted as hog? */
+
+	return pinctrl_enable(pctl->pctldev);
 }
 
 static struct i2c_driver sx150x_driver = {
-- 
2.12.2
