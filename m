Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793360323;
	b=ErBeTr0gi47HZsVNQjFU+s+9VtWQHXnRlMj/ATeWD+uRT6a8gK2M4CG9MGreeSvctC8D
	 BrUERWXLBfk3J6h8J24aAuUa2xyPVyipkz1CZnVJvg4Y74OAkhTzPjpcF3J4Xmn3NNvln
	 tfnLNAH+Myyk6duyqbKbldHSXSQlS2H3rw4hyeuIgO62PQQ+7MZGUEphyVNwRKRechQgq
	 495gaQDFB+jW9K+YlrgBBSe2N7JcBCE67cI383ofwHMr2ciqzPBnPXbXXsllRtntYcV1k
	 s/G2dRNoLwum5d5+yVvHwce6mKl69IGMAYq/wdVqSo9JFe9/Oc3ZlyiNLK4RMvPVRDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SOkIwY5Wk93KvESonLEtNyI9TIjw2H3wAO7wO9t3JFg=;
	b=RrBkaYU7n+bql5p/gV/N/yE2scKFSfEJotLtz1+D+k3RK5RRN3MIk6HROWr1gy66RLle
	 JB9gbUojv1GeNltwkVL1Vzn2IrNAkZ+m1CH3T8UIASJw3JGQCBRFvgXm576YyRMb404IN
	 hJxTtLdDlHAwYi9NzHtb9tf69+HHsO9if6wNajfXtBjk4I2C6tG830s2PU0Z2dthx90Kn
	 Et3b5bMZ7Nnb/e+JSnyeYxznlyWg3/QI+dmnNgYiFrNwXYpqXrUzVxnGKhX1Lm9Sb7P76
	 sCQMmesRXyloxttqg+yRwVj5VOXL+344dqDTHdJ4+k77kmMoka8GlFSsv11YdEJpfLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TbiIQ7dh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC3D606A31A
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 11:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TbiIQ7dh
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso93848466b.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 04:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793360322; cv=none;
        d=google.com; s=arc-20260327;
        b=WETP7+n5u+K4T+ye3hSoq0N31/mfhIa/uSRAyqzODrm/pef8HVvRMdsAXwCgSQPF+K
         gP1WLctsYNLsMXtV79nw+nOj5v0U6yVBSq3VGrwtHQA46ZZSgzx0YjmVEyitCpPpo4pN
         3gfGuZvcDifHkyGsJntou2+dhAjfNB8VJoEnppvNpj8E1ub1Rs2ol7nTu6DV3dItkelT
         8SJRRp9OYDp/9MYeqjvEF7XCy4AK4vM1STpH6FUm8SSA7VMHQsqK5SZm9d8SWwlr+mwW
         j6/NFaRpNlbMQHV0J0D0KkmlJr4R+FPyZDETL3+2Ib3DrTjA8c1shZ994d2xKcMT+Fcp
         kQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOkIwY5Wk93KvESonLEtNyI9TIjw2H3wAO7wO9t3JFg=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=WKEqtN6sQ4zKRlCxRqgm7aie4/Vx6BOBBMtWsm3ZASHPLkRuFzq6sQ8LCNedMPhKVz
         fX/COuyU87aec/O4g5yXPEbVsBy9VlR6zqMIDbeATyBb0+UwC36GNUenCGjfAfuZjmu0
         tMOLi8VWD8QjXKAcfx/IWfEiSL2VuRm73SRZfYwyYJFFh8A/lphUsG+SJWVlx8de3DNU
         BySz6ItBFp70lVE9OfggzhFFUS82TG6N37ROe0/WziRWtucyjza1FTRzE8FRoeOyNbJZ
         iypdML/2qCPIkRJsI2OEK5JSKFdWrW/PTzV3nIj/UByj4dDzATq+7HSgGaZX/ot/rgn5
         c2Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793360322; x=1793965122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOkIwY5Wk93KvESonLEtNyI9TIjw2H3wAO7wO9t3JFg=;
        b=TbiIQ7dhyuJKPoW66Xqk0DgGImSWr95JAOz5hYjcGznpCrC/fgYvQ8i49jsi5j+W0k
         TZ5pEitS+pIvuSSpl1WVAk53TDbVrh4ezAWGE2CxXnn9ufNj6p3H+a1JQimxfJ2TkMzG
         vVjzOsOvnFL+KweLeXaCvnK/yaIJuOTuSiOwksuW0ZLtW/RREw94D2WwkM6RyL/BD2wp
         l4sDy2iJMf1q0g6kWkDWRLVXB2RuAwo6T29qkI95CQoCVqQ8lgKmE0LcJ1gbPAAnjOcI
         x860oll9nbEz8lOgxTqIYvuaNE/6gDMUPX3j7LjZxxJh/TdEuFl8fEsQb6iEXKp0ocVW
         U5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360322; x=1793965122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOkIwY5Wk93KvESonLEtNyI9TIjw2H3wAO7wO9t3JFg=;
        b=ci02ot/oWYJNxH8sKYzFbKYlGQzPx7Tp3q+oMBCiaTeNxjSOkwgI2ySaSkOkNxGRda
         mflAQLcfaoSqIc6ZNjUz1XTkDf9Rvb8tiqWtT19Wf9JClIkkms9ZgucPfKK3lzrXHaGT
         ZG2ZCE8+RTX2PZ41f8yfyUENQgIOF4Nou/nJxCpVKJvzQkRbPJpntLmT0xaMZuN2VwmJ
         jDPfg/40EvqOmX50Myv8K4XDAZPthXMAXrnnK0plnUO5pEmhCCCoxl7MRNGPd6h37E/X
         wlwvrld3cz/QZML4HK8BuAR37Em0reTiCOi98TmOPVsj1KpIXSHVkOXsRC4lUelmhNGR
         +isA==
X-Gm-Message-State: AFq9FYIC3NhPfBxWlcEAQH+JxNJnJfpJ0zekFehnBdmdxrU/8XfRVJyL
	R5Y5DUPSGbH+i52fd/3XPb6OkA2qNQsFIQnBv4FJfjW/x7zWG7gFj7vCOkws60KbevIReyImWeY
	iBae855h5/4wQQ0LKpsitlqJEef2WYo0=
X-Gm-Gg: AYBFou0rF7UiycH4Irur6pRzP3GaNkamHo1+M08MRj0UM9J2CpuxRsazDKyy8LsWUGU
	a0vLC+hCU/DzSt4lCxAzgqIhdMcPzqWSZkT8788NIjwCfeISUTPsH04Wp8ZXJNdSPN0CvGBdpkk
	jA3coEdp2nzch2mfcjR2E/dWkqOBy8CU1p9z3VCM59+ro1hQKXZcuwxHwFAriIpGJBgUdj5VOzd
	rSrMd5RXYhNR8EYFzjsq+UEtpWCR3GFd3OTPJnP8Qh9EWL3svLdohzcrcizcozUnO1vuEn3SSJY
	YSIEA/WGBkdaKkst92SVwUS9XKYFds3WxiEHe69/1B0HZkltzsbU6vS1MLZwdjjm82WSMQvS2Ow
	jHHG0KinLyc366yIED4zhmpzEoVpzerfD9E2HPQ==
X-Received: by 2002:a17:907:9c06:b0:c2d:c17f:205b with SMTP id
 a640c23a62f3a-c4ca7ab276emr172755466b.40.1793360320561; Fri, 30 Oct 2026
 04:38:40 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024123124.3700266-1-yegorslists@googlemail.com>
 <20261030104631.1044556-1-yegorslists@gmail.com> <z6uzdpsuwffjjlca5isgrznpxzlbmfgc5rryvw7keb37r5xogf@aiw7cjkayux6>
In-Reply-To: <z6uzdpsuwffjjlca5isgrznpxzlbmfgc5rryvw7keb37r5xogf@aiw7cjkayux6>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 30 Oct 2026 12:39:07 +0100
X-Gm-Features: AclHuK9xUzGKHFB9zODGiIcn-mg_vsX1VcTD9DMx86B6_V_B8aNwdI2YVG4A9us
Message-ID: <CAGm1_ktZLP4UrSfie0FOybLX=p3dPodyvg-SmucFtm-2u32ryw@mail.gmail.com>
Subject: Re: [PATCH libgpiod v3] build: honor default_library for the
 installed libraries
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 12:24=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, Oct 30, 2026 at 11:46:31AM +0100, Yegor Yefremov wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib,
> > libgpiodbus and libgpiosim) are built with both_libraries(), so the
> > shared variant is always built, even with -Ddefault_library=3Dstatic.
> > When the toolchain or the environment requests a fully static link
> > (e.g. LDFLAGS=3D-static, as done by Buildroot for static-only builds),
> > linking the shared library then fails:
> >
> >   FAILED: lib/libgpiod.so.3.1.2
> >   [...] crtbeginT.o: relocation R_ARC_32_ME against `__TMC_END__' can n=
ot be used when making a shared object; recompile with -fPIC
> >
>
> This is a reply to a previous thead again. :(

My bad. The In-Reply-To was embedded into the patch file so I missed it :-(

Yegor
