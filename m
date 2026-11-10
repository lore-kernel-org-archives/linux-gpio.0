Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332824;
	b=VHNP/hsgaEqxlpCbCzmXwc7a1WQJnJ42AJN+9qAYZKyBKAmXz5Z4mHGrX4+d0oEP8dOr
	 k92jGs0Q5CSSfxe4wcrWME7Pt9awnoLMbX+ShPPDBjzn0lnuiyfK9FP5eNFixKez/v/NF
	 ZhompM07AuPLUJLLnQ2loKpD5Eimj81hoJZGPv521wSPBG+SFltjapefzD9CCM3T5F5t1
	 f8jXiM3e1csAzFGXun/ePxG1ud0qgSUOSWVISdzNltqIYlxVXwApcnFXxseD4LtRRcfSA
	 9HtfiRdkpOAFCjqLD9hqA6jlSEpXoFIK2nqqpbeHZp2+CDxO9VVNp81WhudjnKd5xmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Jp+oM3z+TGlK20rj9Ru+iQ+Q6Mz3+Gb1zIaLcFJ+NLI=;
	b=GZRzhQhCIHt4/nBRfoQ2CGh5Yaqw5gExCqD7R/d9EQdw4gXvMw5q5HRHYViwjwWUt1Ro
	 DGgE7j/M5S9exOsFii8TTqDQhHXKYMwTVGWAXBKOAVH6/fp1DmwSDR+QfyJdPtUEDEVFm
	 lmanCdb7ipFEKh0gR3k4gPRl9b6cf4Qb6RRnsqoSkQPCwCRyuL0g93MdJKDcBEMNy9SC2
	 tqkZurvo//B9z0NKPeZqnQ7TcKH/p8kGSdQtLdDipezJGSjHFRhIeJMVlwQta1ECjQdZM
	 RYxPEOMrROkl3X4gQow0c1sQUUQxKADuYBlXhHpbJqjLYg8l13gwLfDkxILbGju5DCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HaXsInnn;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D179606A321
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 17:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D179606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HaXsInnn
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso997427a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332823; x=1794937623;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jp+oM3z+TGlK20rj9Ru+iQ+Q6Mz3+Gb1zIaLcFJ+NLI=;
        b=sAugtEWeUC5oe8uM0jqmYa3IYchd2Bs7pcW+z4bwnJGRlFWBP72bQ6XQj8b0IqPz9w
         FX87scSxtu0UHf096JctBsZk319pNvq1CoyJgnPPmiyI58sJPNXkaU9NIzK0xIG1S1Su
         tfX2HI2c2xRBv9cZvuv5arzIaCGGK1277TXxHcx0DQmdtyKQcZfVZx0qaLxw87jUlo+a
         2aZ3ORJLP3JYvQLGxDqwZTzs8PMe8ExmfRllPdQATqaYd8sLjWk7nd/mJuY8JoL+bgOL
         3WN9befW6lscEYeu/eCkwZUmIDitEnFBbzAhzOuhmbLTN6+LnN2Dkfwoc/6HefnR3jsW
         OdbQ==
X-Gm-Message-State: APuU4Z+WsuMw8LF70u2UfQNvp9/JNHJWB782SFZf9w2JeTn6LuP02QEr
	CjvMwWf9NvOxuySu+YZR8YN9G/89SdBdyVXfeYO1n6gLVYw0g2yCWItcu8fsF3FYi7XfLXGamy9
	kOkQa+J53UfVPurf0SRWTB4BnHtIIHQ+kmuogAJRq6CnUo9HtHrnaddaOhTsvT9IXVSDnXV9FA9
	UnfaBVS82QvG/gNC6cFwYKnvj3IS9me1LiLEL8jQt33u8qjgKmRcAlFZbK5ssKULFOTvUcWB23o
	fwn9XEoZPCN0LUjX7UiDQ==
X-Gm-Gg: AYBFou1NJaXjKl9zrNXvdcPG4ylgq9LJpbQgCr9wrH60msjgPIYrAGVEHXFdicucfK0
	f5tFya4HLKKGlEzq1LgC2gjnRrvDUSQ/Zl0VPhk1bEhqtvnTNTIIBCleihCiQfKV3oZqxIyeCVZ
	4K5fBIq+65WNXT/o+tp9uSHa5ym1UfUhT4sXjXTEtLy7RgEXcw7FobWWdcSngBLjgUCdoZODeh1
	EKaelEIjp+zL58ei/52kLLscDXvmPcimguicTYrTXn9g8nyAwna8sJgFXRJKNo8pv8urM82Qefy
	fzSe061ahhCEQV1rJOvA6rNaixWWb1xO1LAYHay09tXJWr1yQXHzLohmX3EhOcYS2FOFttYl2MC
	A4mIeD9ELpuva6P9n1kmlwMQu4R045lZeS3BCchvnoDh+MgpaL4KkIzS7/xxJRSXruIshsPSnc7
	uCWD1zEi1dpzjj4P/xfkEtupKsCCx+9A4A56LoZDBc
X-Received: by 2002:a17:90b:4b:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3b166c93176mr3359497a91.10.1794332822755;
        Tue, 10 Nov 2026 09:47:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181f6a136sm9865a91.3.2026.11.10.09.47.02
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:47:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso2155093a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794332821; x=1794937621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp+oM3z+TGlK20rj9Ru+iQ+Q6Mz3+Gb1zIaLcFJ+NLI=;
        b=HaXsInnn/lUnuuaNml2GxjHTj3c2+TdW7y8ClsS+xVx/GVQmBoPUryC/kTFeOndrbP
         McIMfLWOeso3chwKIfeW5bvjBIgHvdAXi2AKPypaBfi+j03CLCOq2gnfq4VwsafwstVf
         VCcDlH0rZdtYs66Ft2fbYqtRI7/LABZ8i9p1I=
X-Received: by 2002:a17:90b:2ec3:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b166cd1576mr3597628a91.43.1794332820895;
        Tue, 10 Nov 2026 09:47:00 -0800 (PST)
X-Received: by 2002:a17:90b:2ec3:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b166cd1576mr3597607a91.43.1794332820425;
        Tue, 10 Nov 2026 09:47:00 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e203f8esm531433a91.14.2026.11.10.09.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:46:59 -0800 (PST)
Message-ID: <79f827d9-8aec-49b4-bc70-117de314206e@broadcom.com>
Date: Tue, 10 Nov 2026 09:46:55 -0800
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds access
 in fsel_get()
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Bell <jonathan@raspberrypi.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/5/26 23:06, Wang Xiaolei wrote:
> brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
> register and uses it directly as an index into
> pc->pin_funcs[pin].funcs[]:
> 
>          fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
>          func = pc->pin_funcs[pin].funcs[fsel];
> 
> That is not how the register field is encoded. The setter,
> brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
> funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
> always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
> number, while funcs[] is a 0-based array of eight entries.
> 
> Every readback is consequently shifted by one slot, and a field value of
> 8 -- which the setter accepts, being the eighth and last alternate
> function -- indexes funcs[8], one element past the end of the array.
> 
> This is reachable from userspace without supplying any invalid input:
> 
>          # echo "gpio45 alt8" > .../pinmux-select
>          # cat .../pins
> 
> The write is an ordinary mux request that fsel_set() accepts; the read
> that follows goes through pinctrl_pins_show() ->
> brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
> Raspberry Pi 5:
> 
>          BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
>          Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
>          The buggy address belongs to the variable:
>           __compound_literal.62+0x8/0x40
> 
> A field value of 0 has the same root cause in a milder form: it is
> reported as funcs[0] instead of GPIO. The mux itself is programmed
> correctly in both cases, so this affects the debugfs readback and KASAN
> rather than the hardware configuration.
> 
> Handle 0 and out-of-range values explicitly, and index funcs[] with
> fsel - 1, so that the getter uses the same numbering as the setter and
> the index can no longer go past funcs[n_funcs - 1]. The existing
> fallback for func__ placeholder entries is kept:
> 
>          if (!fsel)
>                  return pc->func_gpio;
> 
>          if (fsel > pc->pin_funcs[pin].n_funcs) {
>                  dev_warn(pc->dev,
> 			 "invalid fsel %d for pin %u\n", fsel, pin);
>                  return pc->func_gpio;
>          }
> 
>          func = pc->pin_funcs[pin].funcs[fsel - 1];
> 
> Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
> "gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
> the splat above. After the fix the same sequence reports
> "function spi_m" with no warning and no splat, and a register field
> value of 0 reports "gpio". The register is restored to 0 afterwards.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
