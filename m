Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0682B241686;
	Sun, 30 Aug 2026 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076427; cv=none; b=BfucmmpxnzVSKKuvAAB4iDfdYBCGdQsRRkCgIT8KizNxA1mWQSMIhm8x7/eNZHwUye3lchEsGfDTIQXnKuX0WHqgLYVCUjcoSEwl8LENS179fWkmeAbU8S/9xw9ySb8NEAPGpCDh3dRf/izLYGAqIMXqNMFA8yFG3RUbGQKuzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076427; c=relaxed/simple;
	bh=VUeMPa9FyohwrkfRiF8kZfcIyZuYgy4EnQo7t/6sN0c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r23jYpNN2bdI+sH8PEtPmyLO1FJbeP9l7TDdQ/c4q23f83HAkqzd/YRn0mwHuFtppPqMOnZyG7fswU5DMf/Te2qiWpTxvi5NuVGb5lBPLLEuTNb2ynsbuFw3Ryo5oJbzN6AfPdXN4+PwefD3inSdrqv37fdBJVodcejbTkoD+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr; spf=pass smtp.mailfrom=alex-min.fr; dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b=c34t1fWR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C3XBqeOx; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alex-min.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alex-min.fr header.i=@alex-min.fr header.b="c34t1fWR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C3XBqeOx"
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailflow.stl.internal (Postfix) with ESMTP id 1B924130008B;
	Sun, 30 Aug 2026 03:53:41 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-01.internal (MEProxy); Sun, 30 Aug 2026 03:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alex-min.fr; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788076420;
	 x=1788083620; bh=G6epI7ZnNZNtzgn1RABkpJmt/w3yGfJEmW6rZAtvt00=; b=
	c34t1fWRfSKkN5Ew3E/Qk0zgGPUMsOIL0LWR5uE3fiYaTyjC0V94EOk7YNNoyZKL
	Znm0PnFNnMLH5O6Vmz6zzD2e33T/mHB8MgWhIZtRvAgD9F8INgRfPb8/SeSBU3YT
	9MaollBk5QjfdlwvmNMiPhx7rCyLCbxsu3KQKS8SoIIVSz8SZ7iKw9/TPVaIHZXm
	2BIsHWo/QEeutDMozCrb4mF56rwcr3D7Okf3njbNk7sJXSmrkrcBHs0iGFlk2juA
	NKzUJBpXITWETNe36ts8PZij5NBDFULMk8oCGq5oaLkFtRumNZpDAKZKuYU3wb7x
	X8JCAgArA6+Umvma/OOXQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1788076420; x=
	1788083620; bh=G6epI7ZnNZNtzgn1RABkpJmt/w3yGfJEmW6rZAtvt00=; b=C
	3XBqeOxJwcG043QAJE4U4KwBZSLgsxjO6+14VTnE7epHGCvZAu1gsvQ++Td/OVZP
	OSeRe4MDnJwdgAhufMxxugN99LSUgw0W+tEwgy3cdmoodWK47GFlOK2AHt/t77ot
	+mdfnlWsI4gpDwC17TTIPBTtQ/t3nU3vKAr6REkdHZqVDIs0XZjp0MJE+J+oJEH3
	lPbP/tL4d57IBVACMAlGQ6ynlj7rJ6fdDpVxF0yPsxyAAGlrEuPFjX/2/PohRRYV
	qYA/fDPYY83Pu3fDKJdR+OPM18MzWEiyJxEigix9ACiTGj5zdt1Am5O33lE9jp8H
	JQFaTr9CXomA5pFgisujg==
X-ME-Sender: <xms:feGTarNxjiwMV2-BklVkP7KSisV1P37KLV4TsRDfHXRx3pZKvM5QrA>
    <xme:feGTagwPYNmceLMi_kXJJ6ZadIXv9zD7-A8Kwd-WtIaj-jVHDUVoxyn3yrrJ6sJBp
    M7Cajw7ZVZ0Ic6yuzpiaA1BhC5RYpU0dUhZAfZ1q5XH31mKqc5OAUE>
X-ME-Proxy-Cause: dmFkZTE0775jnaewL4xvj4WmD/nTrN0QHquMU/dRaSE6eNZxMPyVt4nSOBfXeJJ7KFzcKz
    Jgrgv2hpwlUjonO7MKfTdnDYbb1IHjk+chT1pM0ODsnsCEpRmCFJeXjnBwV5pxcek4e0O3
    r5g4pJ+yoqE7umYaW6OcJt5lYnZW0hXJtAlwAjVWQUWc87l5I+E1yS4TUdlulBhJaapS6d
    JVKt9ZBaf8E6fcovY9lwRVQAC4lHwBTYuhfD0JI4uEHWpXaWcml3QZPD3k+I/2xOOChHTp
    dZrfGDIzAUaFitPY+uC9pmKgdZm64z0VyG8U5BQw0NML2evsyMGO0TwmQx3wk8w5pUdckP
    q/BsVvDPlcGbozpeTQlg7FeR4M+/5Sn0sVuv7FBkORCkA6SV4oyrbwm6rVl9Id9i0Dw+qE
    Wqvn3MbKnlEO/e7BBAZBGJM9aiU6qGVDlJ9F2tXPz1LOGtWatT0ZT1u/Cj2MMRCo4tqSnt
    9sJgx9uu12sA55vX/hbNbMfS6pUZybg4lCg5S+B+7J5X42HhYhikrRSWgGN+rkC0LGznpM
    l4kOXe6PuRd9wsIItzD7SjdCXggIypQbseaefz30auVhdf40poN65ZafGaFqc/0aTWE/9n
    22wF9OAwwK0xRh19WxzVQRGzAn7JixlRfoVWo8pBQNYRUvt6tHFhUKT0HF/Q
X-ME-Proxy: <xmx:gOGTaoPQ84IUY2_cxNno87X-iuTH3O5CWG2nerRQL7PU58Uun0zrtw>
    <xmx:gOGTaj1tOqTY0taiF2aJmBHliR5B1z8dWXLtKZZqRMncNyL_d9gwUA>
    <xmx:gOGTas1hbV2QSNc5euuRGOQfXJAhv-Dv_Tnu0_RuUSS9cX7mdfPVOQ>
    <xmx:gOGTaiyiDwmr9IrCXdE5hiTqIGxs6y7huPz39eqIU0paCMnhToPfsw>
    <xmx:hOGTaqOTpQopY5N2P1O-eXHbftKN_hs5d7Wy1ciI6BUJwfgQKwZHoz1z>
Feedback-ID: i72694427:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 51157F8007E; Sun, 30 Aug 2026 03:53:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXMGWqqIHK9F
Date: Sun, 30 Aug 2026 09:52:50 +0200
From: "MINETTE Alexandre" <contact@alex-min.fr>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: 
 "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 phone-devel@vger.kernel.org,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "MyungJoo Ham" <myungjoo.ham@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Guru Das Srinagesh" <linux@gurudas.dev>,
 "Linus Walleij" <linusw@kernel.org>,
 "Rob Clark" <robin.clark@oss.qualcomm.com>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Lee Jones" <lee@kernel.org>
Message-Id: <b6a6d425-c981-438e-9309-5aa00bc23c43@app.fastmail.com>
In-Reply-To: 
 <CAMRc=MdKYW_NQpqBES5UcyNqBJd_t1cHiLA3av0wWSWwFgOH-g@mail.gmail.com>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
 <CAMRc=MdKYW_NQpqBES5UcyNqBJd_t1cHiLA3av0wWSWwFgOH-g@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] pinctrl: qcom: Register functions before enabling pinctrl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

It seems the patch has already been applied to linux-next with commit 98=
1aefd53b3cdafae0e45332a1023b80d67f52be, so there's nothing to do, sorry =
for the confusion
--=20
  MINETTE Alexandre
  contact@alex-min.fr

Lun 10 ao=C3=BBt 2026, =C3=A0 13:09, Bartosz Golaszewski a =C3=A9crit=E2=
=80=AF:
> On Tue, 4 Aug 2026 08:34:27 +0200, Alexandre MINETTE via B4 Relay
> <devnull+contact.alex-min.fr@kernel.org> said:
>> From: Alexandre MINETTE <contact@alex-min.fr>
>>
>> pinctrl consumers can request states while the pinctrl core enables t=
he
>> controller. On Qualcomm pinctrl drivers this can happen before the SoC
>> function list has been registered, which leaves the function table
>> incomplete during state lookup.
>>
>> On APQ8064 this can fail while claiming pinctrl hogs:
>>
>>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map ta=
ble
>>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
>>
>> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add =
the
>> SoC pin functions, and only then enable the pinctrl device.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
>> ---
>
> This doesn't apply on top of current linux-next. Can you rebase, resen=
d this
> as a separate patch and add the Cc: stable and Fixes: tags?
>
> Bart
