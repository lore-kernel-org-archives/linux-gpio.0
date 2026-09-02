Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CDE41E6A9
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347177; cv=none; b=DJPF/C72SuKfjgZQjgKBffr446hcY89QMN1Esac2TXv7NuqIlKVw5GHXiaazSIA2rPmyC1HKF73fD1E3XJw3nZ593gQsfUlkV6Q5OQRwkW9XrTHND15iHvQUIya4r5sLJxQKBzJSJSknnYDbtzT466DS7wsPmM8rC9AO2TGnUTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347177; c=relaxed/simple;
	bh=rirgVLAJouSQa7Do0ZcYS3CymL1NmE/yPGFcjOfx1Qc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu659FeX99TzTZU+6+wGX94GdLQmnHKUDtc9cOzPyV38AejN3nbt7Xi0zL8TbyjSPuWkd3nbYVaIaD/zvJwuMw1ZJOjkYfAskPcvkTPh5kzKPtFGyizsB2WHCa0miXPDhsaaSJcVPGE+OWPP2SnVg2zfz2KYQ3Z88jys/s92swc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KirjFzR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KirjFzR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB991F00A3F
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 11:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347175;
	bh=rirgVLAJouSQa7Do0ZcYS3CymL1NmE/yPGFcjOfx1Qc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KirjFzR3vJrjJeeTqKp+KyjXkMBhs2LxhQ2dtIn+SCXzrDv0cZhCQHygODhnR2cp+
	 a4zgYEhnDuxNCiNpHKW2N0ZAVxH9gVXNX98jVLOPouETBx39/PpPYgR+dI8+BgYGBW
	 HuNwo4pxll/hBjnyRN+navcyVRwmQd2qlBSvPjkzVEK7lfCrGT8YC+xNVPvUesDNhL
	 OTxw/b5mJpci+GlcR+9D14IwPc4AuSAv9yjC3Eg236vgqx1E3ll1B0zrvJStxEy7rq
	 v8duUuGylNdNEOH6k0iVVenN1tduURhdPRy6UGHAuKnJzOs5Gu0hfWXDNCAjdMvEnV
	 s4w42yqQpJj0Q==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so7495341fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 04:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJEqt3aKwzYE3cOgnLlPKmmp/nN8YQp5NGC/m5xNijRtjHre6RGxM4B1jcDNIw7e94rtYrS/hx0N44@vger.kernel.org
X-Gm-Message-State: AFuF++kDH4C9EiB1CNLD9GvvlAPZ171SUTsnOcLTFTECXRmdfnjpn7mq
	WBGMNySuW2NLZbgf70447uccV9iVsoabAMppJGtSblV2RdReVY7ejmdvv/ZvucVP/i6/NJgziX+
	WUTzmL7S/fl3joUPG/CiN3IxWv/YcIPlk/XyrVHH5Sw==
X-Received: by 2002:a05:651c:30c9:b0:39c:9955:9e00 with SMTP id
 38308e7fff4ca-3a34fc9c509mr7017021fa.2.1788347174422; Wed, 02 Sep 2026
 04:06:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 07:06:11 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 07:06:11 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <99593b39-6851-4ad8-aba8-d4a39192e5ce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
 <CAMRc=MdKT4RAWdtZf87k5-VbXAZePT2yttf2QPWgRJaowKuDTA@mail.gmail.com>
 <a5956f0f-2842-4b80-8bcf-8763836618cf@mainlining.org> <CAMRc=MexQO0r-4+yPQrY_rCcGUY0E92q9hAD5EoTpwLJxMmX8Q@mail.gmail.com>
 <99593b39-6851-4ad8-aba8-d4a39192e5ce@mainlining.org>
Date: Wed, 2 Sep 2026 07:06:11 -0400
X-Gmail-Original-Message-ID: <CAMRc=Me4Anv4Dh8c1BdBV-_HY8Dc4cEnpthLPEy-QZjJ3u=E2A@mail.gmail.com>
X-Gm-Features: AcwNN1VpAOYISQq5-G0xZjQB_FRNe0s-IVKYkLPQSF1m3JchI0lJM_4i5FR7Lv8
Message-ID: <CAMRc=Me4Anv4Dh8c1BdBV-_HY8Dc4cEnpthLPEy-QZjJ3u=E2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for MSM8952
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2026 12:41:53 +0200, Muzaffer Kadir
<muzafferkadir@mainlining.org> said:
>
>
> On Wed, 2 Sep 2026 03:34:58 -0700, Bartosz Golaszewski wrote:
>> On Wed, 2 Sep 2026 12:32:45 +0200, Muzaffer Kadir
>> <muzafferkadir@mainlining.org> said:
>>> On Tue, 1 Sep 2026 08:59:00 -0700, Bartosz Golaszewski wrote:
>>>>
>>>> And to that end please use scripts/get_maintainer.pl to get the current list
>>>> of maintainers for your patches.
>>>
>>> Hi Bartosz, I did run b4 prep --auto-to-cc before sending the patches. After seeing your message I run it again to check and it said no new addresses to add. Should I rebase on newer tag?
>>>
>>
>> Please wrap lines in your emails at 80 characters.
>>
>> Are you based on current linux-next or at least v7.3-rc1?
>
> Sorry Bartosz, I accidentally sent it without wrapping.
>
> I based on v7.2-rc7.
> Should I rebase to v7.3-rc1 or linux-next?
>

Yes, in general you should stay aligned with linux-next to keep track of
changes already queued for the next cycle.

Bart
