Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A24A2E0A
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138147; cv=pass; b=mHq04mDzqY4i5BAjAyxiAdZYbOF3aQcNcbuzQhwJsTtYrv+3RUv8wx7OI5RqR9T9p4hQCegKtH9JuDz6jUybtjBOWfgdgQu3VXoOwIWGwR2kp6kMA+oGDAmHbO6Kz6o/a1Z+H9t02TZuz8OrjyC44FJPpQf1BQvJy+Jx6Ugl5bE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138147; c=relaxed/simple;
	bh=t0NQOLYqHWDz9VsRSjuVoji+SI41r96ungAAD1Kanl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISxD0tBD9blA6PGqu5VTkogGtiy8BN2zgKTm7ViqxaQWKMF2oMtahaMQ6N/fyOi659FyI/oew4QiTorNWfqAjP6fSUNYVlMPd98FuyXG4j4cV3PICxTyshIgeDq1ZRyAbFcLmX/fZ1+jonw70+dnPXXLghoA+AMd7YezFec5GYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgKv2/1A; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgKv2/1A"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso8825835a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 10:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138143; cv=none;
        d=google.com; s=arc-20260327;
        b=M8aLuVpR1s0PEWJn7RCRjMD6Z9erwVVA2xJg0ZLWdDb/JWg6S/bF7AGiQPymqO1Xu9
         hIsxXxnP3/gu27YZ8x+BbxhDyNmp5y+hNsxcWBzwkH9xqk7HvVZPSuyYGpz34axnW8aO
         dVQWjrzCaVSiSuUCCzEJJZHhcgbpaidCTFZ0rUMONZsk2VFoSqPe3aGkZNOC5TuqB1FR
         sl/uQgUj/3zy3XD97ZA1kRKEzkQ4lEwHFH2QYDv5LpN1uytP3p+2IB39e6kibJe5y+6r
         XAanOPqC8egTG/uTcsxMj9u313m9tzoN+J4RivOdWWOkk6h/bbv1XN/qBecJUJNbERnG
         R0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        fh=Fq+4iKTz05I7QABSgGfn05J+B2m66Yjr8Y9Ppkj3XF8=;
        b=DRzvS/09KmCtUlUNiHGnW4bODGs1vvq0b+wouSk1on8L4gUjW5hUJZMI6BbYq79An5
         59mBxv9th0RxcaT9ek6tKYRVL7Ab4B7qbnObAivf/74raQl1bdn+e4DZG5IrEW2YZg+F
         R2kfoniR8zIIE2NVrXh1EBFdsfyls8dVOz1qwUBO5fMaujtDpdrGiVDaDoww/jjrqkM+
         x7v+jRV1l2LBZfsUmbXqV7X+pWh11ggD7iLVZJyl1urwfqGech5HkMnIzyl0rgHakvYd
         z+ISKWKdJNVrNa2lF420MHjAk2oaotBUHpsbrp0zlNOT+nGTmYh4+rs55x87tUQ1XT25
         Nrow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784138143; x=1784742943; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=lgKv2/1A3Qpu3dh33l55DhDZ2WtOfRur9GvjsEMwzA9HDB+dUvz/FuSaGvWaOvO5+j
         FlXO74Majb2FoMEPFvHMYKxiHP4LXOJLt/kFFOt/dzDbaWvKWhQ+yah0PJkEJBLiyUoB
         /QeLjS2mnBxfuV4BC/qkivLafCM65Tg33yAbx724+nWPUeTnZs9gi9ewYNNHUHpve9QS
         sbrVAAdE9muwlAs73JW2WhIewcVXhmWzqO715dlQfju5fvQtRozsJnjzSPbHDzdy5AHl
         Osxv5MGrJz8w9EH97sSBZHzBkGx38AiKZKD4xFyQcMP9i76iF8GzqzP0c+RxH7midKxc
         9Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138143; x=1784742943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=n16poBOj3D69TGAOD2K8HATROac7uVQs+mTsj2Vr2iHbxWRvrc3EPIjq0JHbyqYfUs
         LyH8mYKSRF3arWEFbGY2CWhY4ZfN1Co+Hh3H5MRrXcZSydf/Xux4eTkWJeh0pb7Sw55+
         54SZ8msqU/3J/7dUM3kz+EIWQhtw5bwjXyZ+Tt3KDNYFj5Z0y7HuIaLy1+QS9lYcjdn8
         VAEOsk9fET5xGJ+SuOtj3BWfgbNxEeP4uFWy+eKlrYbpyPgH3JCeC3YAnwVrdbv7RvLB
         gB6I7/Skiqg3K0x0JjHGkCreLp5VUxpj9TdOkxBdML6Z1S04PxIAk0OvcyRxKRUUVKqr
         dJfw==
X-Forwarded-Encrypted: i=1; AHgh+Rpri9HbECvpVH17FFil34gtQKyyJ4pmY7Efl6FIBafsRt8odMsBrmtBHMuQeWhOQoiMoY/vLkVZ4HwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4S1UD78L+CG0omfF0pvulfuJdqxQGSO2ed18KA4MQZeFyoA0a
	oQkcVmlZI4QBNNuOtsiwIOeqkxXad7KSTsMExyvq5JUKphhHCAgXMdaBfxkF9417aZ2TDAlYUUd
	rjh/fDkFtn7k2fkZ1NpuCAK2obsa8+E8b+qYzRwjwAg==
X-Gm-Gg: AfdE7clkvYTeBuaoIAMm76G51nXPAUnfiRwtxtU0fkw+uaw68jczKqdQsAzu4wQ0cP5
	3at+aKlEvl0UzKBfz94QtAylvf3JQCNUc1gt3G74ze3e2X3VeGm5etg6YXLIZc8P082ZZ3CW1N4
	EDE4Kkz6Yfg9Ncx3d8TtSKTrQ4co+4dazdmfUAhLcf1I+rSmBrGPKdO/jioIrYUgzmNQLgevpv9
	ELdoMw3xsh8R+RuHi8cMgXbavMOlM+TE+nGEObEPG4qwrtM8pI+IvNhzHFbJ9Gr44UgGB5jHrgs
	EYmelV2MJynKy5AKRGRbrrMT+v2hcqY=
X-Received: by 2002:a05:6402:1588:b0:69c:7567:cf5c with SMTP id
 4fb4d7f45d1cf-69cd6ddfb91mr4781134a12.41.1784138143408; Wed, 15 Jul 2026
 10:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s> <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alemgbM2ktRLE9wT@p14s> <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 15 Jul 2026 11:55:32 -0600
X-Gm-Features: AUfX_mzC-pSYEjUJ9BYRTa4GlO7TcNO2B0DY7O1_KieZEYL7x6Ya_ZTaPmF0Y3w
Message-ID: <CANLsYkww_2d_eFGCTrTvoSavdkfOh41joKHypDnW-z0XUonR1Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 09:55, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, July 15, 2026 10:26 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> >
> > On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > Sent: Tuesday, July 14, 2026 11:36 AM
> > > > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > > > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> > > > <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > > > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > > > Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
> > > > linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > > > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > > > <andrew@lunn.ch>
> > > > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio
> > > > driver over rpmsg bus
> > > >
> > > > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> > > d
> > > > > > > +  - 3: Both edge trigger
> > > > > > > +  - 4: High level trigger
> > > > > > > +  - 8: Low level trigger
> > > > > >
> > > > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > > > >
> > > > >
> > > > > How about cmd 2?
> > > >
> > > > Yes, I forgot cmd 2.
> > > >
> > > > >
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +SET_WAKEUP (Cmd=16)
> > > > > > > +~~~~~~~~~~~~~~~~~~~
> > > > > >
> > > > > > I already commented on messages that are not part of the
> > > > > > virtio-gpio specification.
> > > > > >
> > > > >
> > > > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > > > >
> > > > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > > > operation on the remote processor, so the remote side must be
> > > > > explicitly
> > > > notified.
> > > >
> > > > What operations would that be?
> > > >
> > >
> > > The operation is enabling the line as a wakeup source. In practice,
> > > this involves configuring hardware-specific wakeup settings (e.g.,
> > > register bits) on the remote processor, so the remote side must be explicitly
> > notified through SET_WAKEUP.
> > >
> >
> > As I said before, we are not enhancing the virtio-gpio specification.  If the
> > functionality is not part of the specification, it is not part of this protocol.
> >
>
> It's about the functionality, not the specification.
>

No, it's about the specification.

> Without SET_WAKEUP, a virtio-GPIO line can still be used as a wakeup source, but
> an RPMSG implementation cannot because the remote processor is never notified
> to configure its wakeup settings.
>
> So both implementations may follow the same virtio-gpio specification, but they do
> not provide the same wakeup functionality.
>

No.  The kernel treats rpmsg-gpio the same way as virtio-gpio - they
need to provide exactly the same functionality.

> Anyway, if you want to drop the function, the command can be removed.
>
> Shenwei
>
> > >
> > > > >
> > > > > For virtio-gpio, however, everything is handled locally. The other
> > > > > side does not need to perform any action, so sending a SET_WAKEUP
> > > > > command
> > > > appears unnecessary.
> > > >
> > > > What is "everything"?
> > > >
> > >
> > > I mean masking, unmasking, and marking the interrupt as a wakeup
> > > source. All of these operations are handled on local processor.
> >
> > There may be enough capability in your remote processor to do all that, but we
> > can't assume the same applies to all implementations.  rpmsg-gpio is not about
> > inventing a new protocol or delegating actions to the remote processor.  It is
> > about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
> > _exactly_ the same way as virtio-gpio.
> >
> > >
> > > Shenwei
> > >
> > > > >
> > > > >
> > > > > > > +
> > > > > > > +**Request:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > > > +   |      1      |    line     |           value           |
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +
> > > > > > > +- **value**: Wakeup enable.
> > > > > > > +
> > > > > > > +  The remote system should always aim to stay in a
> > > > > > > + power-efficient state by  shutting down or clock-gating the
> > > > > > > + GPIO blocks that aren't in use. Since  the remoteproc driver
> > > > > > > + is responsible for managing the power states of the  remote
> > > > > > > + firmware, the GPIO driver does not require to know the
> > > > > > > + firmware's
> > > > running states.
> > > > > > > +
> > > > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > > > + configure the line  as a wakeup source. The firmware should
> > > > > > > + send the notification message to  Linux after it is woken from the GPIO
> > line.
> > > > > > > +
> > > > > > > +  - 0: Disable wakeup from GPIO
> > > > > > > +  - 1: Enable wakeup from GPIO
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +Notification Message
> > > > > > > +--------------------
> > > > > >
> > > > > > "Interrupt Messages"
> > > > > >
> > > > > > > +
> > > > > > > +Notifications are sent by the remote core and they have
> > > > > > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > > > +
> > > > > > > +When a GPIO line asserts an interrupt on the remote
> > > > > > > +processor, the firmware should immediately mask the
> > > > > > > +corresponding interrupt source and send a notification
> > > > > > > +message to the Linux. Upon completion of the interrupt
> > > > > > > +handling on the Linux side, the driver should issue a command
> > > > > > > +**SET_IRQ_TYPE** to the firmware to
> > > > unmask the interrupt.
> > > > > > > +
> > > > > > > +A Notification message can arrive between a SEND and its
> > > > > > > +REPLY message, and the driver is expected to handle this scenario.
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+--------+
> > > > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > > > +   |   2  | line | trigger|
> > > > > > > +   +------+------+--------+
> > > > > >
> > > > > > 2 things here:
> > > > > >
> > > > > > 1) You did not include messages that mask and unmask interrupts
> > > > > > at the driver side.
> > > > >
> > > > > Interrupt masking and unmasking are handled entirely on the local
> > processor.
> > > > >
> > > > > When an interrupt occurs, the remote system masks the interrupt
> > > > > and then sends a notification to Linux. After Linux processes the
> > > > > notification, it sends a SET_IRQ_TYPE message back to the remote
> > > > > system,
> > > > which then unmasks the interrupt.
> > > >
> > > > This is the kind of information that should be part of this documentation.
> > > >
> > > > >
> > > > > Thanks,
> > > > > Shenwei
> > > > >
> > > > > >
> > > > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as
> > > > > > such, this whole protocol should be about thar:
> > > > > >
> > > > > > +------+------+--------+--------
> > > > > > | 0x00 |       payload         |
> > > > > > |  Q   |                       |
> > > > > > +------+------+--------+--------
> > > > > >
> > > > > > Q = 0 requestq
> > > > > > Q = 1 eventq
> > > > > >
> > > > > > The "payload" part is simply the format of the messages as found
> > > > > > in the virtio- gpio specification.  From there, the only thing
> > > > > > left to mention is which messages are not supported, i.e get line names.
> > > > > >
> > > > > > > +
> > > > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > > > +
> > > > > > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > > > > >
> > > > > > Not part of the spec - remove.
> > > > > >
> > > > > > Given the refactoring work that is still needed, I will not look
> > > > > > at the implementation.
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > > > +
> > > > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > > > @@ -16,6 +16,7 @@ Contents:
> > > > > > >     drivers-on-gpio
> > > > > > >     bt8xxgpio
> > > > > > >     pca953x
> > > > > > > +   gpio-rpmsg
> > > > > > >
> > > > > > >  Core
> > > > > > >  ====
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >
