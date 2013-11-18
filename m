From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Mon, 18 Nov 2013 11:12:00 +0100
Message-ID: <CACRpkdaKz0BmQhG-RimT0S_JBn=DdftpGv5PYxipRkrqK2mouw@mail.gmail.com>
References: <CACRpkdbG9emZg-6oOO8MgwUgCkqQB6+QqYuNAOo-QN0e+wYq2g@mail.gmail.com>
	<871u2k49cd.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:53517 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194Ab3KRKMB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:12:01 -0500
Received: by mail-ob0-f177.google.com with SMTP id wp4so6681793obc.36
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:12:00 -0800 (PST)
In-Reply-To: <871u2k49cd.fsf@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Gamari <bgamari.foss@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 13, 2013 at 4:20 PM, Ben Gamari <bgamari.foss@gmail.com> wrote:
> Linus Walleij wrote,

>> I think what Mark is saying is that you should not define a new node
>> for exports, but instead use the node for the gpiochip and extend
>> those existing gpiochip bindings, if you want to do this.
>>
> What might this look like? Should each exported pin have a node under
> the gpio-controller?

Maybe that is a good idea.

> If we want to allow for pins to be exported to
> userspace, a name alone is not sufficient; we also need to provide the
> allowed directions. I think this precludes the use of a plain /aliases
> node.

Sure.

> Perhaps something like this (please excuse my ignorance of devicetree
> norms)?
>
>         gpio1: gpio-controller@1400 {
>                 #gpio-cells = <2>;
>                 compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
>                 reg = <0x1400 0x18>;
>                 gpio-controller;
>
>                 pin_a: gpio {
>                           gpio-name = "pin-a";

We should not use names like "pin" because the pin controller
subsystem deals with pins. GPIO is about "lines". But I get the
idea.

>                           gpio = <&gpio1 2 0>;

You don't need to state the parent when you're a child of the same
controller, as you say yourself in the end.

>                           output;
>                           init-high;

This is essentially the GPIO hog concept that I've been talking
about before.

I.e. I think we should specify whether this is an export or not
and make this mechanism available also for non-exported pins
in that case.

I would like it to look like this:

line-a: gpio-hog {
     gpio = <2 0>;
     export-line; // export to userspace
     line-name = "foo";
     hog-as-output;
     hog-init-high;
};

Yours,
Linus Walleij
