Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FDE3382D2
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507662; cv=none; b=Avs+8iWH7PVXguTm9VbQmPc6xpjTqsbEiKUIyNhWQi7gDshkmn8q1OHMiDeA4DFPFNZk2qs0ewPYSZKZAQsUZLD07JvWffOIIxF7/32MLqnp64Nv0B9DbEZbyeQJiPqrjsFB29cuzWhlsHXaatwSPNDJwvufVfPTKh3M88eROX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507662; c=relaxed/simple;
	bh=La6ovWe4JDYFXsmg6YsoV2xlDST6N2pFeKiwrg+V0t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPF4teDt6LB0vw1mh+OOHB9Ssp7a8Uyj6TVExMBeYYn81vMQ0fIA8fwkAXOWELqDwD465/zMYI15YrSfIq5mXLmb+AKNnNDHU3ZEMqHDQ3kHrt1l//HdOIHVksYh/NASpfPgf+9uxN4ozO6yCB6DTHRQAj/8e0fiem9a5xP5F4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alXGeBCq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alXGeBCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E93AC19425
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507662;
	bh=La6ovWe4JDYFXsmg6YsoV2xlDST6N2pFeKiwrg+V0t4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=alXGeBCq/7KlK7rEMrv2gOKSM9TkhHkYpwHTU7BEqOsLU2Oe7McaupHt4jN5KVYW0
	 G3xfZph6CfxDrPnJ3ybYum9Q49U0l8UON8fSyhrqbTvmGk2mikD5bzWgenVscf3WVC
	 Twu78GthRX7dC711zt0ZZkwXvAR4V831SYc1HvAa/CVsGcbA+kHFIJ4vhjMqLusbQk
	 G4AU7yVB+dwfUP3pLdvi+u6SWmngxRIOMyAbQDbEgsNJ5sRHzP4t286r/4LGmdJTH8
	 bFKuDQdbrKRF/SDn7wfhC0xY6dd5wL4raR+kvbYIeAH/0pusyWoweZD48Ovv/2A830
	 3+DJc2YOt/3dg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-648ff033fb2so5034222d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:54:22 -0800 (PST)
X-Gm-Message-State: AOJu0YznLfHTeZ1saZj8/a1Vqtw1CzR2exd2Mt41+gYQ+orMZyrxDp/S
	OQZaTOPbi5FEBopxaIF6KdasSQ3JQHhIlFUx93L9mxKF3waklBJugWLKLPgxTEvFeRhNY4nqW5L
	VCuo/arl5f0mDrxlGJSKPr8jgFMmbtRg=
X-Received: by 2002:a05:690e:12ce:b0:63f:b4ee:7915 with SMTP id
 956f58d0204a3-6498fc1554fmr611652d50.11.1769507661665; Tue, 27 Jan 2026
 01:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
In-Reply-To: <aXeCgo5w1YOHUKiK@black.igk.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:54:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLn5AQP-+OcYqw+05eprJDMv8u21UOdEos4=P4GRdOBaLw@mail.gmail.com>
X-Gm-Features: AZwV_QjCylZiz_82ZrhJf5rKX20VtWgzTMl_frogIkgHRTJlTmkZGVLH8J3N_Wg
Message-ID: <CAD++jLn5AQP-+OcYqw+05eprJDMv8u21UOdEos4=P4GRdOBaLw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.20-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux pin control <linux-gpio@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> A small but important update to Intel pin control drivers. The main thing=
 is
> documentation fix by Raag to make users less confused about list of suppo=
rted
> HW. Everything was floating in Linux Next for at least a few days.

Pulled in!

Yours,
Linus Walleij
