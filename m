Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565174;
	b=iMFRM/So08K1vBenwPGIMoNgPQIbfrudaTaiHQhoKixv5Wtri7SfBuY9tGosd/jYOjKc
	 9Vs3HYTT6MyA5UItZbnS72mh9ncGh7XmfbVIG2M6+fzIri4bF2pJaGV8zWI2q/B3kxXlM
	 sCGvDSiP89/arzPitDxTeez88xhEGimSzd151OGsLikfWTR199rCO0+GJWfT8KEEcewFD
	 Rj4QpspO0EwL+DfaT5QsUfHlDasCtPDGE2/mNKym2MHIvvuZ296+p2DI6enfrFvcI7JRr
	 /ULogdCbew1qBBOXiVdEKUKBk7V1U8c86l8mFxjaP6VIkv06tnoyNzK3vqEZRP0pZFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
	b=wthnhNANDZLG8ZaI8CbYQwETiz4+eR4M99DlGpxObb8/9SUkekKrwdld6OjdLawCKzC9
	 dIdCb4WcAK/ONSd1Ckg+/S7Spyv/jNaNrtdcO8VSq+ywYwgq+5LL8991eXDvX+NyYZcDX
	 +DOgMiZAp8K5px4yeN6BWt6c9FPuvEXK5DgtnO3I345D4JFRF3D4G4OA5ImLZVr6AyPMW
	 +NUwBN5eUiqXcAjVtN9JRHk5kSl1qgs/AjT5Wxour6UOhcyC3Zt2cR3EHAgi5WMSU2/qV
	 3052gUcGbuMGFaFfqGPQnUGn4lZkOwbDggnFmIbPxgS9IgwuYDME/djpaDi/kek0naw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N3K8Bbb9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D1606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 06:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N3K8Bbb9
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917bab38b14so4663206d6.3
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 23:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565173; cv=none;
        d=google.com; s=arc-20260327;
        b=Us3RBtre+8vosojktS2BfqAbDVoShMBFD/2CdfpGbbaebYxPz/o/jh1S/k106EX+Aj
         R1A7NUeJ9upmBgEEbVWZv8i5WeUEflatEUwtNSllBrXkRafERs14yTZ6dmjiBWho0SXe
         XJu3jbgmBzX8S/OOeEuw0vZflEhekofJ7eCbTSWj9yC0kAEH/V7M/u+FU+LwJPEJPL5c
         m+pdckU9tdf8XT0zPH142N2I1HApRx67/M+3OUzSIyRM7wReBrCqljGh5VpKI/rF5jRV
         h3/ck3rF9M9ZKzsu/zKaS+wlFWmANRFGW4tRFiOpAFXbn9s/D2GGjHNd0LzvEndYAR+r
         S9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        fh=/AdlCMJF6qUuLsczI7ru1wBLS4H93RtTxxx96z7H2I4=;
        b=Dkx92HUbPOiAU8sgSVyPNEBqtIQW6NXvqYUTKMuU0Mo8+gEEEZbsvOGtNAzML3pDvl
         qaRpUc0gjpgPKbq1sz1HdsHZYvYIxXw1JDagMNDlBhaTXGklh2hfIAfQeGzttvFzGPga
         g41A9QNqbPAYR/6qjbScNZUFmbFq0bUVxgObp/QMDZysqLBXW0XJ9MuWo/1iDxtBcvt9
         CH8VouEkZW+/QcSMBwHy8SvLPGH64uv020HqcGg/Zo+OQr2s13xIPTNrvcKQaOX5mlGM
         77omzreXQFpbm4Z8x+7Tq+vS8rNtvjQdfmQdQxlpMEqIJ8iZ8JVkc6QP+fGKwJyL+HDJ
         30KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565173; x=1793169973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=N3K8Bbb9tNmHLFt6ZXFDabkPNwYz0MlgUzh0K/zfhr2yAjtdkvQ+atM46OurewOaR1
         5GpHZ1w3HZLexrrVA23itcwJ6z/A3tv78GFsLEvhUonkAC/73dFWQMqQxs4AzcszUoAg
         QywB+6q06BHod6vzHnLg7lTEveFPsMcBeMrLr3fmzfBfZu7SyUZlS+rtU0CFP/tt5s8g
         rXTl04SHDbrB/z7e3KtddFWqAgqZuw1vN7ipKBmLQJ+HhmthCk+mdogVDq20OH2zdFz9
         er4Y6laPpOvP7dFZUifXCwXVCDWoAe8f6eCGE6CSv2DC0EwRrBbnT+ttWzNfLh3PEE/8
         ufzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565173; x=1793169973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=s+gP6zgiiny+HGuAES4iIkKA5rp83rtl35fbSITc5ASDhxg6Q4+nrKbhcoJmQJ74Em
         eUNls+FgG47GfId0lOl3/6cZx2EodIbyofaPkl6DNayHzwtqAzhF0bsRN5TxDQvyaBXV
         KoDWHFEGwkgoIutOZrJ9BQKWAJh47HTWIG+r+saNNQGqebFhyqik2IkKCbBEKjRpRZKM
         oVdTLM5yukvJevDxdtu44yQXf1kTRQ4apAyr+bwKvHEfsFvFXvZ1HXSB0e/HNKlp/zMS
         0/bnbarCB3MHJz2IS91/ikJ4unz98yxpRQUtYSjPMkFyW0UH7ZwRJAJRQ8Y2hbO2kxa+
         +gaw==
X-Gm-Message-State: AFq9FYKZ+TleNlDrONRxKV+cczNJVgDeicOtVYDC559Mu3UXLyYuag0N
	xqWRxbH1TUP34+omyH1Vb0Q0g4Mzq95xisyzpJPk+q9cgoJvKPJbKmtPYJcx6m5nlv74wOHNIfM
	VmHCkAQDSx+llirlS4YtAY95xUOa84q8=
X-Gm-Gg: AYBFou0n+rfd3Mv79ybB23tAkqQFwvhUXhnQDWqKwEPBLdOVWI1mkzfGwzdAHj2ISOV
	+kP4zn0ByHMpnrJv0lvAN98SP+uOIeEU7yy2WIgvkxDPckQdpmWA/7cuiVIFrc3E71kIwLaUSjL
	cBNPa3B2DAkm4b5oYyR03kPS7BCi0eQgUN5KEU7PPQHZBISSSnam6xaX9Rq66dlcBEAHRX4yz2z
	HzyqRGmB7s2KJr/dM0AtWFMKwPswODLHN2LD/ucRnci1WLAJYCn/opVeUzQ/dONuCCyU+5yypcR
	vdMcLVk0tE48IXZXEBXg8kdwnLFuNfA0gv/WE2h54649twwee/1nCkFZPXOE+1nfomzt0IulOZC
	cjJnQCFzftS+j0TASV+gTH+vH7IaKbX0s+tSeciFUF7bbFhG7SixUl10e4d8=
X-Received: by 2002:a05:6214:487:b0:91b:cafe:58e2 with SMTP id
 6a1803df08f44-91c12eb7b30mr18765456d6.14.1792565172936; Tue, 20 Oct 2026
 23:46:12 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-6-a0282524688@gmail.com> <sashiko-outbox-169117@kernel.org>
In-Reply-To: <sashiko-outbox-169117@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:46:01 +0800
X-Gm-Features: AclHuK_sk3N3reGEV1vFqkhXmWhSRT0CO9e7SvF9FhuKig6lX9RUqvijqALmuJY
Message-ID: <CAOoeyxWNsBt6nDn82bCv0DUpar3c_K19su87UEbjm4CfCJbbHA@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] mfd: nct6694: Move module type macros to shared header
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, mfd@lists.linux.dev, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] mfd: driver-specific header modified in global include/linux/mfd/
> --
...
> > --- a/include/linux/mfd/nct6694.h
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -8,6 +8,15 @@
> >  #ifndef __MFD_NCT6694_H
> >  #define __MFD_NCT6694_H
> >
> > +#define NCT6694_HWMON_MOD    0x00
> > +#define NCT6694_PWM_MOD              0x01
> > +#define NCT6694_I2C_MOD              0x03
> > +#define NCT6694_CANFD_MOD    0x05
> > +#define NCT6694_WDT_MOD              0x07
> > +#define NCT6694_RTC_MOD              0x08
> > +#define NCT6694_RPT_MOD              0xFF
> > +#define NCT6694_GPIO_MOD     NCT6694_RPT_MOD
> > +
>
> [Severity: Low]
> Are these driver-specific module type macros only used by the parent and =
its
> immediate children?
>
> According to MFD subsystem guidelines, driver-specific header files shoul=
d not
> be placed in the global include/linux/mfd/ directory if they are only use=
d
> by the parent and its immediate children. They should be kept local to
> drivers/mfd/ instead.
>
> Does this addition of driver-specific macros to the global header violate
> the subsystem architecture guidelines?
>

The sub-device drivers under gpio, i2c, can, hwmon, rtc, watchdog and
pwm also use these definitions, so the header needs to stay in
include/linux/mfd/.
