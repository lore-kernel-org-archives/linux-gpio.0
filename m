Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594DD3E3150
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698327; cv=none; b=C53sAy+Givjcjt0TI9ekEyF0kFHNogN1fBF1BUefrLdXbz38IMjpDdwRZv3Q6Pbj0iH4Mm56Pjp5BnFxyDezTf27nu6fMydeFKc6AnadM82mOHroHNBAC+UcCfwFziETOtv5iLJJKjqQNJM4p9iW2SVJgNeCg9T9BoUH1igQtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698327; c=relaxed/simple;
	bh=V6tikEn2hr2XJhkZ7MZ/cLagG1PvMs+wbI2c6+WFFfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECYz8RHOkcp8Sd4GZ+RYanC8lazg1C7D9vyICYDh4sR55i9kkBmoebCTfRURzmo8m1BKdRGMHHQAjU4hzW5gdJe5NKzSh8fkJlfEKLvuXSa0yjX7NXo+I1FzW/1vdMTyNchn/hmnqe2sFgfrsRgF7g0gQgZ/vRTTeFkWEYtmczw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mn6I2p3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mn6I2p3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1511F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698326;
	bh=V6tikEn2hr2XJhkZ7MZ/cLagG1PvMs+wbI2c6+WFFfM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Mn6I2p3NT49y1G7ef+dnQ07v6wCmErWgDzQxihtRnN5tyS/xFth3MwydYxUvl5DbW
	 Iy+k/bcC6QWzVW7iGpOf/3c6kcoyUp7JV0oIkQSAblfpO2dUxHPUMTsGccgeuA9keL
	 vJ7yAWbbLBMQUib/tqQ1G1BH7k6Dh26c227LouD/W8hXVR/EeielrW2PwYSj8Gnb+3
	 +Cfx3vo/WT3oK5lWNKzuMtDTN5ooO2gK1Jhk/pZZpDC2Ot186rXeI5H0fYnfQFBfol
	 t30NioFQ6716q6UDI5VlAmzJwr3vKYij0XCygNqX20CWFqR1lpgfoTSia0ekhO5rjz
	 kGn7e/9KMKFlQ==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7e613b4f268so1548171a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:38:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98JE1fCr1wQMPWd97VBN05bCBBlxue6guSwlIMRtEgXeFN8STlDvBkmbbeovK2XMNlKg6yWc/zolLl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86Jk/RzZ4TMxuptqFoP5TlgnWSZyUahLDv0SQTokDvrDVCXo9
	rY+gke3QMAOppWGBuSARb15qsWMai0uyuv5FQYjDzr7RB2hjIm7+QbgdbCdflbFuktYtDdCrKJk
	2zGrN+Ob5ALUteygJE9xJMebQMkp8afI=
X-Received: by 2002:a05:6820:1f11:b0:696:13e9:6863 with SMTP id
 006d021491bc7-69d7fa92ff9mr5565954eaf.2.1779698325463; Mon, 25 May 2026
 01:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
In-Reply-To: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:38:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKR+9fvhXwOQ53UAzi8R6HbRCGW3ma_hXYUfZe1YSSUQ@mail.gmail.com>
X-Gm-Features: AVHnY4JKwVew49Q4fxnx6ZtpKkcGwDqGmEGjn6WhiD5lDC8COfwEGNKuuzO8iUM
Message-ID: <CAD++jLnKR+9fvhXwOQ53UAzi8R6HbRCGW3ma_hXYUfZe1YSSUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Replace open coded eoi call with irq_chip_eoi_parent()
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 10:38=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:

> Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
>
> No functional impact.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Please resend this with a commit log including all the reasoning
requested by Bjorn.

(Maybe that is already in my inbox, sorry then.)

Yours,
Linus Walleij
