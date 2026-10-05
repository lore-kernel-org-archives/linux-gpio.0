Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7314D221FD4
	for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2026 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211749; cv=pass; b=dGQ7oQEm2WEpn1MChZW2G/sAFe6X66PKouVlIlhq+bp1j/fO1FWk+Wn3z3HV2uXZ4ptGX/5ljUwawP5w/QmIZrSHSXI8lyvpUOcRVq0byEm+XA5lzHSHXYEV6hfVWl2ZmirSJasWneLIJu7qdDmriXFyW2SsRANJMy7ECzxcr7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211749; c=relaxed/simple;
	bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ql9hdwwlxL4WTn1nMe2AywTvnx2dWXVdjZAmcPV9CcDsrPXY9wff/HwbR3y9HDHYwEPjgiSVi5cgRls5x/N2vFcMdkh6oTU7gkFXfBEVcrM4GxCRM50lxKkNSK+Jlx4b476s886lplCnsNJB62+8awGI/vPhRZyXMoPqLWI+YDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFWLWfds; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFWLWfds"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66fca0709caso1334422d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2026 07:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791211742; cv=none;
        d=google.com; s=arc-20260327;
        b=Mq2x+9nZSXxW620nyGmATTqo9/Glx37RNLvQwb1lmZMR8X1tLHZXc8ezIwIJohtOdD
         EvLPqND3DN9KmPoCmOmE8+9z+O1tfvqwBcaZNfXf2Rc3O4DcAv13KxRu4Zgmsx4qtj7v
         CCBuSf581mwZp6ABMhroK0mLmOrm+dBnXcvhoySTj1HNTYV4SX+YUI00w+uEbtXjPpBQ
         Awdf6sX8TGfQQGHSPhwjoCRckDjMyRWSH29W2ejVDxs8cwJ48N4vjSPZLRgd0SoZsfVV
         HFXZVBhn294WvtEUG2oKEoSQ+Aj/xPjaU6Re+2Qv0cUFMJzjUv4TbXe9dIyJ3JLUnHGN
         2hYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
        fh=WeSJWZWk/JB7Gw94Ste3k6lljqOjRB8xmK9XjPNvnN8=;
        b=ZDwW6HzIAmGSHYhM1Qx9ELoGBnNQk/m6O9qhqN8bekTNi0Yp1LeKuA8DdhcgsK9OG4
         cCyIZxNst/K2qv5KTgPcPC97OSt42GOXXtoi7BTM6M7awDuBiajBvxD11UjW/ahUjYvA
         fsTjdTjM4l/fhPOt/kzegMcKg5QZ4HSC27kIhJWtCU1fxekQvFe7ciQo99na3/1ugYiv
         Jbq6sCevg8q7SwvXS/WTqJvDcN7zjcNVG6cg8sK1qazWxhnAF6ucwe2xj1/qXEDtqqrO
         akxSPw7iIejAOYUCYZjGUyL9CVXH5h267p41S4ky0bN04MdJ/0nJa9lmmXY/Ute00Ckg
         EUrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211742; x=1791816542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
        b=HFWLWfdsikQXKQIit4Z4T8nS0yZBOA16ZYycOCOAXHaVF9Quozd2z0y4JfWcBIfjVP
         OXuSpwEO/CDca88djqC3Ffj9pn1N+GO/kjkTx8SG95nNTg78riohfwE1FvRuUopzlATn
         2HI3p5VN8/qOWmUMj5a21MCy5COZhlWLPFk19SI6hRUwE099Obc0Fr4MgIUvCINHu6pf
         FxXY6GqWWp1hlD2n81QKcpcrIlalUJKfJhzxmxMqhqv40mL0dWHHOIc0lTxprMs5d3eO
         FArpiwZAk5EU3iW0EvkCBEiYTLgMyjCYiXzvHO79ulYcUzkWBq/7mHbIdWyvcAvL1WTe
         Azgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211742; x=1791816542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
        b=PsiTXD10vKmIqup0KKhT7rqwCTGDLhPMnljrIVmGyQ3lsPeM4YgdjS4ae3yvy1w/zp
         jVuicC6l1ntQHXmsR4q2ZBV3v9Txx+Dii8DSWmq+g/106xlq/ZMWCiAx5G7+QI1WCko3
         2/cWObzmYrnN9ARo2W4XyHo+MDuHPmHgWLstkQqFrZbiqqw6Lb7hapS0trx0nCbIGSkL
         ud6uSiaQnGY+dEdV+f+Ew1+vsXc1N3BOzvzdvAnAFuQ4B9uw4TXoLlkZgSRV69ZJ8Vjt
         4yU4UBL+W6VQs4VrYbBRRE1nZcGrVkjKV6EGEWTpobbhSY6uYLRdgUoDxBFF4SxJtWhl
         S1Wg==
X-Forwarded-Encrypted: i=1; AKwUvByN0gFkUg/EbzKBlvgRltZtH3XYbwnmBX2teWRqrAuDz8/QjgPXgXp1+xPzxMaDi9Rq/u2VfYDQa3Sb@vger.kernel.org
X-Gm-Message-State: AFuF++mdGoZx00D0jTRpkLIliWlH+3SsU8X+IZ8G0sfKAogKZb+fTDu/
	N+YG8k5zgKOv/fhR1H3rHFLgNYuUw6osmdnla9LnpuGEdLhh8rOUKSYpitYhdiNz5v++hNIlxJk
	XXWnQF41qTL+/Si+iWzFxXynWRrE1sUY=
X-Gm-Gg: AYBFou1xTa1shQbaqtHCdCJdnqnT/mcKQ8PTTncPJvVMfkjtKyGaRd+cW9g2wBJOxEt
	3Wz+72BS48oI5Gst1suZkqK0P/Xzi/6iOG/ZZd3G4VLkQ6G4697fE4FW84xxUkeBizOtj4OUhfa
	kEM+tCTH5wcKjrSvs5RJrpk6clLBTobixigNvjrqU+5In7rrGv9SgNVTthzreCczI2pslCtDEqx
	z/vj9BAJU+Fyfm3DiMyCsa7H/M7zMiz94ahyguFtGj7mCMSR/F+7m8P6+gT0D/1Lr7kett2YFi0
	yVi9SfTwoqQ1MhYrmbUGiY98rSLH6SdPWNwSBBM82D9r++MxA1nCDaGY4LvoDRABo1i9
X-Received: by 2002:a05:690e:480c:b0:677:b1be:b19e with SMTP id
 956f58d0204a3-677bd373b92mr1921206d50.42.1791211742356; Mon, 05 Oct 2026
 07:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
 <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 5 Oct 2026 20:18:51 +0530
X-Gm-Features: AclHuK8FXl1Xi-TJ1LO2CDPJEBnrHjPYEMHi6FAYBhWO1gMQvCkpvwAC2mRCkhQ
Message-ID: <CAMFFDGjK8xg=S+f3MyaV+6hQ+6x=g-NQhEAzKMu+X=vdkauq6A@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Billy,
Thank you, that explains the behavior we observed.
The use case is that GPIOP2 is the physical power-button input and
GPIOP3 is the host power-control output. The board normally keeps
THRU1 enabled so the physical button is passed through from P2 to P3.
For a BMC-initiated power operation, the vendor temporarily disables
THRU1, configures GPIOP3 as a normal output, generates the short
active-low pulse, and then restores THRU1. Our OpenBMC tests reproduce
the SCU4BC transition and GPIO123 logical pulse, but the host
power-good signal still does not assert.
Since THRU1 and GPIO123 are mutually exclusive, this cannot be
represented as simultaneous gpiolib ownership. Would the appropriate
upstream model be a dedicated power-sequencing consumer that
temporarily switches the pinmux/routing around the GPIO pulse, while
the GPIO lines remain owned by that consumer?
Regards,
Prasanth

On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Hi Prasanth,
>
> On the AST2600, the THRU1 pass-through and the GPIO123 output share
> the same path and are mutually exclusive, they cannot be active at
> the same time, so having the pass-through pair also controllable
> through gpiolib isn't achievable in hardware. This matches both your
> observations.
>
> Could you help us understand the use case? If the pass-through
> already handles the host power path, why is switching to GPIO control
> needed at all =E2=80=94 rather than simply keeping THRU1 enabled througho=
ut?
>
> Thanks
