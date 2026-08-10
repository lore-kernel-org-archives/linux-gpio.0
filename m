Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74C03BED55
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360187; cv=none; b=mdj0Bt+5jFtnGAcFxEUr3TYdf7zfbRT3ck26JxTUGl97fOLEtf3Bkcdu5Cpk2Ft+53O3Nb2t31now+AdGhpLLHaMud31PDvNMdexPbIjiukBoa3/afS1kbLRhtGKHzIn/G69gQdFaJ3IxA/3F3OzeOaLRGguSf+kiP6JHkvA+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360187; c=relaxed/simple;
	bh=R6SJa9quMISsNuUCuhJb/DeAvtNBiKOa51XFiH57Z1k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HdkeGPMPnEF3r3wIBJJODldmwWtM1NzjvuSqTwKDwFEf8oA1WvaWHLBn9sw8Enq8CNJfqe2/maKKrou0jYni6ng6+GKZTCJMazVv7EWZPSJLzWur8sPp8FvqGSEAwRNPfQcmgCaw75pULduDhNoCoAyW526WCUleCSaO3paMPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/FhO5F2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/FhO5F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490BA1F00ADB
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360184;
	bh=+i1y8yL9YAYFT62cpVPzTGawg3vYnjAPvjLfzKDRmEM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=D/FhO5F2sV4IxIhK1P0bkFiKHh1wfrZZAaE9mkRmBJlrDdrOpU+R7N/gw/FnudknM
	 M4AlTpswHLrWfUxVx72Qb5od7cyr27PxkNUwFKz7+LB/GL3Ct00CA9x7Y/0Ftc1883
	 5MNz/8edXk2nkKGWaUK9+D1jEEFoCjj8QgYpU43IRVgVBZwunFUHOJ1OCCQz8T1jd5
	 40hO0kbnY/lnClPXpdcZt67et6qcLd+e/ZlUVneozHl9hieOenTVHlHkCWtfCUG6Lv
	 LdjJHHh+sZ/nsRNnFc9wLiBhNbYe9b45g27Phr4dq4uX0V0zox7PMj63EoJtQJjhES
	 X4s1P1mUjDXTQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1862558e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrp4WJFSP7oYp4YbzRvZSPZJfoavqMvrHjuRMpc3eSitvnviH2a12Y0lRT+43v9OD/PJ4WA/cFoQ1uH@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMrufIhayiVznBTnOFINLBvjKH1t1nObroEBQCzEH+HpqeKz9
	etRKB31t3DAmCsyC0OQXih7G+AuAni4lxix1MOosXFD5QH0VrfmeWiWTTlh4/OQT+ACGlOGjF/w
	rCPODpAZ238yjKUWa+3EkV2kHn0rqUFY915mR2bzOVA==
X-Received: by 2002:a05:6512:258b:b0:5b2:a328:cdd5 with SMTP id
 2adb3069b0e04-5b3181d45aemr140129e87.49.1786360183004; Mon, 10 Aug 2026
 04:09:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:09:40 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:09:40 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr> <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
Date: Mon, 10 Aug 2026 06:09:40 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdKYW_NQpqBES5UcyNqBJd_t1cHiLA3av0wWSWwFgOH-g@mail.gmail.com>
X-Gm-Features: AUfX_mzvj27fy-TnyaVg6gCrjEOz19GIONuwg4d8eLhDGRNod6vnIU9SEq76_hs
Message-ID: <CAMRc=MdKYW_NQpqBES5UcyNqBJd_t1cHiLA3av0wWSWwFgOH-g@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] pinctrl: qcom: Register functions before enabling pinctrl
To: contact@alex-min.fr
Cc: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, phone-devel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Aug 2026 08:34:27 +0200, Alexandre MINETTE via B4 Relay
<devnull+contact.alex-min.fr@kernel.org> said:
> From: Alexandre MINETTE <contact@alex-min.fr>
>
> pinctrl consumers can request states while the pinctrl core enables the
> controller. On Qualcomm pinctrl drivers this can happen before the SoC
> function list has been registered, which leaves the function table
> incomplete during state lookup.
>
> On APQ8064 this can fail while claiming pinctrl hogs:
>
>    apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
>    apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
>    apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22
>
> Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
> SoC pin functions, and only then enable the pinctrl device.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---

This doesn't apply on top of current linux-next. Can you rebase, resend this
as a separate patch and add the Cc: stable and Fixes: tags?

Bart
