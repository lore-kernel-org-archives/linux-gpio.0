Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A292EBB8C
	for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348834; cv=pass; b=QzhrTQ+B8kbYt/GX9W4w+WWky7EUkd90RCShPj4WMlOyv/CI/zAA0LF94C+3LEVs/f/yCJXm5lzZV/tEm0LjQT3W9VkHwq1bK1X9YD6IJ38sZo3Ys+dR0bzNhR86brjk3P4FZiao05C0Oa9LvLYMPjgo3b8c29Bul3JiFBf6DTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348834; c=relaxed/simple;
	bh=NZLPbEn7VyX5cG7VSKErkfmUY76epadoj9amqzL5JfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5dk0dFFkL61wXDoMfzc4J89a1IHqg5m7RH50wBjuD++CHG2TyKjEE5ZRox6CI69FTiqKCRwJFA1W7sbYlGQmkQZmi8nWHLwSMCpF0GHkBf/A/LThruF2xcsp9OF7Xfx3tlj3IH62WZWkjyBMiRXJlkCi2yOU03oM1SWHEJtGlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJH6Qt2Q; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJH6Qt2Q"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so1533375a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2026 14:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787348832; cv=none;
        d=google.com; s=arc-20260327;
        b=IAAcmz9xlGV98b93kTcYn51uuyaJvwuFez+MOw25/DVYg8NAdIlFDwrpLg3KvcuTIP
         NxtIrD7DRjnA1fWoOkrslLnfh/6A1PRw+KFajUOGMOdcHiYZTdR0D+ZM8UQvE0yQCUD+
         YrjOc6LnRPR+8OiobIysXv+Af0TvmKmT47GstmZjg09E/jKKMc/IrATMpXaHZ49ZQwfN
         QSzfFTCrUn2puxkwvzmERLAYuTMcqQzpDBjMSlwzV6PjT2gRkvQrvEXCLz4vZtu/96YJ
         8te5mEZT1hPAsbGwOZjIS6ExRr9gG+GhQOLEh5CCFJQ6rBXjcYAUGqfptomQABfqKa4/
         6pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h+ubHCMHtfeb++dsYIZ6AaDOtRT8vE24MQm6y+Pt5X8=;
        fh=SRWe0HUg195bLT9HExBgbXONy2SpXoNizjCdIPr28P8=;
        b=EN/gbfLBiBwuQ5LOziEtrsaqP/b/YlRcg5lWcW92unN6X9a/53gSjzH4ohPb0ig4s9
         vCXdj0xvUEF7wwo78AWUDeC0aaFWsUf8lfZ9UJBYZUswdCiCTfKM7CzDwPwQ+JMR6Ud9
         uF+xCaU3UG1Kv4eF6ugUbCcH//5zH2d8W827sNdcGzxyQgPjIsRhSYZ7N9jAn528J0l5
         knpyf8GoAZVWV+Sv3Hgl2jkc7KXK8YxJgNSq4BS9nNWU8loqe+D7RIdBwvEc4uHFyw7j
         D7Brx/yamZaMTezOt88hef8moUWoXW+TGc0pFLbHyptbPTHvkFZ3zcmTiGrk+r3MKWsY
         +MVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348832; x=1787953632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h+ubHCMHtfeb++dsYIZ6AaDOtRT8vE24MQm6y+Pt5X8=;
        b=QJH6Qt2Qdkl/3Y+wUfum2PUCE4lVZXlckMfaTeaReIaPl5GeLLEZs3hl866wt9NXL3
         r3sJibk7qerxBOQuGBKTiu5wn1djyGASQFuLMLtuwwnJfxRgAYJ6E+zXCqj8Vqxtp0xm
         p78F4XRUznknkSY40KEhWIXMQGiutRDejCeCKnH6C7Vq3s7U96qov7DWgCG4Bh2Re310
         MVavN+bR5dkKJP4o8CDy+0PrywsCKgTucU88n6T3218alWDVwI9nVCDYta2sUx3X2ku5
         trNDY2OsebB874YwZwfaSSYF4HX+BLpnIXZKXzk4xNT8SVo0G3lqJYeVRkw9PCfo3Zua
         8p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348832; x=1787953632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+ubHCMHtfeb++dsYIZ6AaDOtRT8vE24MQm6y+Pt5X8=;
        b=E4Mc0va0vQehrEc9uxAzAKGWy5Gx+Elj6JaEg/rh+Vm3xiZaxmSPmXeCEE5ls/MyHU
         epgmMfQWagm7tIZhS9QPbUK0zNgEfx7VQ6H0Z9RsfmoEXuWpr+53McpF0uWAZp7rJWo4
         26giHs82CcX8q9pySD/VXisQSZEUDmnUwWJm2BxznE/HXr1ZuvzfSg+/nia63hOIgp/9
         jNT4UBnlOevqvUWa4kvH394HGvckTGZ30hYNPDG7eAp2LaQVed5oXD4q7U91hS4cJut5
         IS7DSYu29ukNo6u4u8r27/l6b+7ABnesNAAxHrMmcSBUNAGtdj9mA++nVvdKHO4nwVQR
         FMbA==
X-Forwarded-Encrypted: i=1; AHgh+RrYnhrt2Cz9862JRfE+m/WfBDDUbOMXLBiWFyuVnjGkEot4UBH+b7lXWzOwBAKQlShjr5/uzRaJCjZU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgAmSJ7bAZjsjk6wM/mz3A25NCRjvQ8w1zPdJ1ENCXg6mWLjJs
	UalyVuxP5a1EmvSCrvbAaJQTooHabU0SdBuWLthOhSk13Dmh9dCVdTRuYiotNEWLoMLf+kqJDvT
	UlZWuq2KGjxwwh14Ldc0rDKnOmQmQjHk=
X-Gm-Gg: AR+sD10pG34cmqgNk9Z6AWclLgTmMDrq9CnwbQeEvBBpEaWsJkhYQvgGCc19F6GEnWK
	YmvwL3tZgV61pVOq1OTexcevNQJPNGIFtWhBSO057AsNo+RQre2KoVaJyzHwEZRw3sT+U5gB9ZW
	e/z8C5EX3zqxIrg+ZwLaqRgm2gSRKl9c3GgrmuEebdK0HyXb39wLoffSBrLIHRzkTUNSgzsIcRa
	5WlifnKYyRJvHYtFkGlJg9T4ocfm6wQWz03pHSi+dCLVWmZt3+cqFoF0ucrK+zbGuWIlsD3dNNx
	VxuiAhGgsWc8TCIKd/O4+Sa0fAoKmEg7A8AErPoIAboR+csqfTWFEGoGpW3q+Yb858rD1buvAVU
	p/Xm8yE85ltvdZ0O9pXpTsAu9VBfvW4NwNXQSsfLiSGvhuwSelVdPMv3PQp1lSg==
X-Received: by 2002:a05:6830:6a87:b0:7e9:c102:333d with SMTP id
 46e09a7af769-7f4619572c8mr11634924a34.9.1787348832205; Fri, 21 Aug 2026
 14:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821070651.39763-1-vaknins33@gmail.com> <52e55283-f628-4a85-851b-fe33dcdd9c47@amd.com>
In-Reply-To: <52e55283-f628-4a85-851b-fe33dcdd9c47@amd.com>
From: Aviv <vaknins33@gmail.com>
Date: Sat, 22 Aug 2026 00:46:35 +0300
X-Gm-Features: AcwNN1VZoQoLMVYyn4SzQV1Ts9hv-6bzyKM30_TolLriSbfFXa_qUlqvxbu1yFM
Message-ID: <CAMpL-YwbRe7A+wLxi9gi=q7VuufHtaoLDiLTm1fe_jK7J3D8Ww@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

Nothing is physically connected to GPP3. The bridge (00:02.1 /
\_SB.PCI0.GPP3) is unpopulated on this board (the ZenBook UX425UA has
no Ethernet or secondary PCIe devices there).

The DSDT seems to have leftover definitions for RTL8/RUSB on GPP3 from
a shared BIOS base, and routes GPIO pin 24 to it in _EVT, causing
phantom wake events during s2idle.

Here is the acpidump:
https://gist.github.com/vaknin/142f5cbad15958e9025cd81960114f6e

Thanks,
Kivan


On Fri, Aug 21, 2026 at 11:49=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> What is connected to this GPP3?
>
> Can you please share your acpidump somewhere?
>
> On 8/21/26 02:06, Kivan wrote:
> > The ASUS ZenBook UX425UA_UM425UA (with AMD Ryzen 7 5700U SoC) fails
> > to stay suspended in s2idle (Modern Standby), prematurely waking
> > after 1-3 seconds with 0% hardware sleep achieved.
> >
> > In the laptop's ACPI SSDT tables (SSDT15), GPIO Pin 24 (hex 0x18) is
> > defined in _AEI as ExclusiveAndWake targeting the PCIe bridge device
> > \_SB.PCI0.GPP3:
> >
> >      GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullNone, 0x0000,
> >               "\\_SB.GPIO", ...) { 0x0018 }
> >
> > When the SoC powers down PCIe root ports into low-power states during
> > s2idle, an electrical edge transition triggers a spurious wake interrup=
t
> > on GPIO Pin 24. This signals the AMD GPIO controller (AMDI0030:00 / IRQ=
 7
> > via pinctrl_amd), aborting sleep across the system.
> >
> > Booting with kernel parameter "gpiolib_acpi.ignore_wake=3DAMDI0030:00@2=
4"
> > completely resolves the issue: amd_gpio reports ignoring the wakeup on
> > pin 24, and interrupt counts in /proc/interrupts remain at 0 during sle=
ep
> > cycles, allowing uninterrupted s2idle until intentionally woken by the
> > user.
> >
> > Add a DMI quirk entry to ignore wake events on AMDI0030:00@24 for this
> > system.
> >
> > Signed-off-by: Kivan <vaknins33@gmail.com>
> > ---
> >   drivers/gpio/gpiolib-acpi-quirks.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-=
acpi-quirks.c
> > index a0116f0..dd4db58 100644
> > --- a/drivers/gpio/gpiolib-acpi-quirks.c
> > +++ b/drivers/gpio/gpiolib-acpi-quirks.c
> > @@ -392,6 +392,19 @@ static const struct dmi_system_id gpiolib_acpi_qui=
rks[] __initconst =3D {
> >                       .ignore_wake =3D "VEN_0488:00@355",
> >               },
> >       },
> > +     {
> > +             /*
> > +              * Spurious wakeups from GPP3 PCIe bridge interrupt
> > +              * Found in BIOS UX425UA.301
> > +              */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."=
),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA_UM42=
5UA"),
> > +             },
> > +             .driver_data =3D &(struct acpi_gpiolib_dmi_quirk) {
> > +                     .ignore_wake =3D "AMDI0030:00@24",
> > +             },
> > +     },
> >       {} /* Terminating entry */
> >   };
> >
>
