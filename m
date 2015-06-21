From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Pull-up/down control via sysfs
Date: Sun, 21 Jun 2015 15:42:17 +0900
Message-ID: <CAAVeFu+7y1dexCvtoOcYFn48DJGE5_jChQQ8nWpz7uwf7fNOHA@mail.gmail.com>
References: <CAPoCmY+Py2Ngq4M8OwTV7egSp7bQoGR4kbFpyRN6+DGzHZnfHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33367 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291AbbFUGmh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2015 02:42:37 -0400
Received: by obpn3 with SMTP id n3so13583628obp.0
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2015 23:42:37 -0700 (PDT)
In-Reply-To: <CAPoCmY+Py2Ngq4M8OwTV7egSp7bQoGR4kbFpyRN6+DGzHZnfHA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gottfried Haider <gottfried.haider@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jun 15, 2015 at 4:44 AM, Gottfried Haider
<gottfried.haider@gmail.com> wrote:
> Hello all,
>
> I am interested in implementing a sysfs way to control pull-up/down
> bias for gpio pins. I believe the pinctrl subsystem offers a pin
> configuration interface [1] that my driver could implement for this,
> but I am not sure about cross-referencing this from the gpio subsystem
> and getting sysfs access..

GPIOs have open source/open drain flags that I think can be used for
what you want. The only problem is that these flags cannot be
controlled from the sysfs interface. It should not be hard to add one
entry to control these as well.

What do you need to do exactly? Do you just want to set a pin as
pull-up or pull-down? If so, using pinctrl seems more appropriate. My
suggestion only applies if you need to control the GPIO's value after
setting the open-source/open-drain property.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
