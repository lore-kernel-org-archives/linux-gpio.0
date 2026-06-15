Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F373E4519
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 11:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781522623; cv=pass; b=PF8CNlk+NuLllDWXAhntWE9942VpX3ApoECQIdocli7kW6Gu1BGr1NLG8Bh3FFDdJK8LOz3mgrHTcA3O65V1UH6FvqqEDk0dCwO+GRseP47AIGSiqglx3eDZgPmrvOc4kHQ5Pm4ZCvFM554MeN8btfHiCjUv/rqNPL2mZSLgR78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781522623; c=relaxed/simple;
	bh=fxowNdtIkrFrYf00pH9M/s9vwagygSDXwOzJaRFd58E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPbsIQUpc4GlMpBDztj1jT09ZFOo11uKqURr5jp7PNhDSXsaqUMwzlitkSQPnYaBhiqRB5vt2Zbfuyh1mS57iJ3dTZsTxboj0Fk9QaS2CVvxL6G1whyn+6RMllbg7xudNZ/YNOCbfqF3s59WxQOnkGQRrToBxBaaOWsQ6n2oe4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOeRt+Lg; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOeRt+Lg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eec22fab7so1362147f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 04:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781522620; cv=none;
        d=google.com; s=arc-20240605;
        b=hnrJSSF4hwX90WX/gfBOYXo0aN8vv6GboUPV6Oc9+nyDtmJOiWqOoIRfUiwhad+kot
         9EfgP2ogZes5bm2fsYACbLKLc9Vx9dnu3nIzykSkQQdvaZdqmDNGXe7seVqD7YseyqNJ
         9aODnTNREB0XeWE8/Wt+2UCshY0EHEcLXFpqHYt9xwIUOAoZ4S9pQbcQDXP5fOP1WaI7
         bmjQK6k28sc1P5jZcUoGQj3aNOtbKz2inwvU21iUrp+XgZXV+g0gU2C5E2REEA3nNow1
         5Cd3Kd3JPNtv9PY4KubCqM/yFOb8rNo/9BpkynuHVr+UQwAoDSyjTC7tt0sqxTrwt0Gy
         zZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iqpedztH8Jz5dzHLUTPJjvFLbJqLYfgVCuwziBxTSGc=;
        fh=t0qpBYbDBf46Fj418Xrc5rzYu7cs0ERdKNFpAM21Wdo=;
        b=hGAUjiKsG6Qn4Ho/53jjlBUPSM0m42Ee4KCZNm6OtzYXgZ1NIsjybB1gkhRGcavKc2
         /U4V1UWg2sFkTFlSM9kv1Y7KPYWjSHWT/aoYUyJkrWHIYa8oLVVlUPmIlfXiqeHsEs91
         h4xGT2HhcB5vo8xHk6+DSPQ6cuM8KmnBbmuAkaONHaJgw4Zqe4nOAmP5YOw0bydiZNPl
         SuaMYOTfJJtSFp6wb0J+sfGRk432BQDN5SGWhXSOrrBoVKM8wKQbt0qgpiROhfM+asYH
         v5z+pHlRJi9AeyC1mLRCMJIpadDIU0LSJGCFxBo4wbSt4Qpgv/H1Dhvu6P6Lqnn2apLJ
         Lb5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781522620; x=1782127420; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iqpedztH8Jz5dzHLUTPJjvFLbJqLYfgVCuwziBxTSGc=;
        b=sOeRt+Lg3LRZ1zng41oakOO/uimedm3UtGYqfjtflNKxGPE6h0UMyU4LjV3IlSIfNZ
         7y6dR8DK4KUrlOjvDZcgQf4ditDs2cxcoPogiLMxMpdLeL73mB1IjqImnZAF9Qs61QyJ
         KVdIBgtHYcZkl14U/qlUBy31tVIicNzW27fbSsbz+XJpYK6xLdQhtPLzIf7j6lbqhE+g
         UNE6SZDg4b46r/qTBM56tXmDVxNIDUKNydTThQODGAU3jsPiKEP/0pKHWaikt2uPiZoZ
         p/DJxnrJNYQN1wPmbw1loDrCJMWdZIUp1zaTYXrQs5EMmbon3wodTrel/visxnDNZFF/
         0iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781522620; x=1782127420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqpedztH8Jz5dzHLUTPJjvFLbJqLYfgVCuwziBxTSGc=;
        b=ge5m6JJMCdhHSN8IoxrCezFJQP1c0IL5erNj5Ax2BbeMl2r6kOtjMXbP779j02i2PV
         unOqfg6S+yXhc0BzUkBfCb3oNqT9BeWYGByqmp1BQ3R1hnGyVXm2wr+0q0fLUexxJ1no
         QLgGgBmvFbZWxwKp6q9B1w1twv/6A9gaa+V8aVujSB5vbomvaSPtvtIFl+I3jiQvGUpt
         un9SVUzcuiGTqH7w77GMdRtn9aFDcsRBZbWiL/6c18L3ulA/bqj7C3jz1Q8G/lTo73Cb
         67dTvJNBHxJZykrZZT8Qn1dvqnuf+ibgt6NYl7kv3CCicUcyEUK+gw0c6ov1TgQuypmB
         zSng==
X-Forwarded-Encrypted: i=1; AFNElJ9Cnr/GGxXMwI2E+4D6SnWigki68y5anA+/3CxaBWEuQ2OJkejiK3f+2cOGsUNE1Y3c5OrjKC8O83tI@vger.kernel.org
X-Gm-Message-State: AOJu0YwiiR1Ve8VxiJpLf+1rYwtT6fTqKzlm9aF8baK3EeA1FVPo9goH
	tBFBnZDAlKYkO2Vo5vHPJLvocuPJl0w4hn4cBuSCcQeZlq6RvonrGsmZTwioaEAWbgyytPiX5/y
	4kKgwW7Ap+YJWmcTuIoFjjZnCTv6wXSY=
X-Gm-Gg: Acq92OGdtlI+uPHi81JNQFs+L84xXLCzF7fkCa67aeF36zlmelgcw6zJWcT9ZITPJFd
	ur/EiiKC+IHVscIOEevvSuMhmrgXnQQyHJoJ4s/GTqID8J5m4scN+x6AqpPlDJoAvLvO6eFjx2j
	guT7XZUwN08qOhO/oAkdsRCzm5TalYt63TdpeEPKHyz/iB2RK1HKc7HqVD0th6GW6bnxz5TtocQ
	uuqXJIavKqw6pV07QSYoMzgSACOATGBTAHd9zg6Ri5XOthwhScZDIgvGiNt3aJBgJjrilW4uOFZ
	ZYKnsii/iQ==
X-Received: by 2002:a05:6000:43c6:20b0:460:e4d:bd46 with SMTP id
 ffacd0b85a97d-4606dbc679dmr14093969f8f.21.1781522620534; Mon, 15 Jun 2026
 04:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com>
 <20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-2-4111b256c840@gmail.com>
 <d6453a9c-d2f1-4aef-8caf-e351c210d6bb@bootlin.com> <cb694725-b3f3-40a3-94c7-0c1606aaea94@bootlin.com>
In-Reply-To: <cb694725-b3f3-40a3-94c7-0c1606aaea94@bootlin.com>
From: GaryWang <is0124@gmail.com>
Date: Mon, 15 Jun 2026 19:23:28 +0800
X-Gm-Features: AVVi8CfXkkorPhlZsi3ReZla8Kw3JPYZT7CoXWJqLH6ghfI4BsD9VWEc0ltwplc
Message-ID: <CANYHO6qQituEPwAgb6YNRmsK0PbPxzKvSqSEHJApVw5xAzuHbg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: upboard: add device id INTC1055 based UP
 boards support
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Daniele Cleri <danielecleri@aaeon.eu>, 
	JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 17:37, Thomas Richard <thomas.richard@bootlin.com> wrote:
>
> Gary,
>
> On 6/15/26 10:01 AM, Thomas Richard wrote:
> > Hello Gary,
> >
> > On 6/12/26 12:13 PM, GaryWang wrote:
> >> Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12",
> >>  "UP 7000" boards and I2C/PWM/UART/SPI pins mapping data.
> >>
> > Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>
> >
> > Best Regards,
> > Thomas
>
> I did test your series on UP Squared Pro 7000 and pinctrl driver does
> not probe. Pinctrl device INTC1055:00 does not exist on this board.
>
> [   12.818773] upboard-pinctrl upboard-pinctrl: unknown pinctrl device
> INTC1055:00 in map entry, deferring probe
> [   12.818795] upboard-pinctrl upboard-pinctrl: error -EPROBE_DEFER:
> Failed to select pinctrl
> [   12.818801] upboard-pinctrl upboard-pinctrl: Driver upboard-pinctrl
> requests probe deferral
> [   12.818834] platform upboard-pinctrl: Added to deferred list
> [   12.818894] platform upboard-pinctrl: deferred probe pending:
> upboard-pinctrl: Failed to select pinctrl
>
> Did you test your series on all boards?
>
Let me know your BIOS version, we;ll check internally, thanks.

> Best Regards,
> Thomas
