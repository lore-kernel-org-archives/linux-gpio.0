From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over suspend/resume
Date: Wed, 15 Nov 2017 16:08:32 +0800
Message-ID: <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
References: <20171114104136.25595-1-chiu@endlessm.com> <20171115080446.GY17200@lahna.fi.intel.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=cp936
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:34772 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755958AbdKOIIg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Nov 2017 03:08:36 -0500
Received: by mail-io0-f180.google.com with SMTP id q101so736522ioi.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2017 00:08:36 -0800 (PST)
In-Reply-To: <20171115080446.GY17200@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com

Hi Mika,

    Yes, that=A1=AFs the most weird part.

Chris

=8F=C4=CE=D2=B5=C4 iPhone =82=F7=CB=CD

> Mika Westerberg <mika.westerberg@linux.intel.com> =EC=B6 2017=C4=EA11=D4=C2=
15=C8=D5 =CF=C2=CE=E74:04 =8C=91=B5=C0=A3=BA
>=20
>> On Tue, Nov 14, 2017 at 06:41:36PM +0800, Chris Chiu wrote:
>> The touchpad in the Asus laptop model X540NA is unresponsive
>> after suspend/resume. The following error appears during resume:
>>=20
>> i2c_hid i2c-ELAN1200:00: failed to reset device.
>>=20
>> The problem here is that i2c_hid does not notice the interrupt
>> being generated at this point. Because the GPIO which connects
>> to touchpad interrupt is in ACPI mode after resume and no longer
>> work as IRQ.
>=20
> Hmm, are you saying it is initially not in ACPI mode but after resume it
> magically is?
