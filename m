Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285574;
	b=xelTjeDXZr5WDd6tyM2tDbXwxwH0pguo/svhTHsVcfN/hvH5CszjLP/JwQRZ74saOKlh
	 10E5JBCkgszGq06jDRVx6KsUXXsQPYA/q4R2Wa5nHYR0Lj094q0sjaJv3NfDE13xU+hnZ
	 lC0kCqI1gh2E4AG0ArY7A5bXAGIhLw51jwWG3MoRmLcTgbOG4UTV9E7Z2XOlWj1Zsiv5K
	 cP3NpNk1VquKPeqCZ7x1vjJaGwgu3eZVG9nA0IFPiA13wD4Yru/8RauqPWGk26DMZQAFW
	 D8lntjzEfxjz90g7rdUxiYZbcnnlWwkv4Lvz5YWAlyunh5mF/cNLrO7wWUVFA40BVaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285574;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ZTaaMQzGS8QNSoGQ53tnXJ4N7sHJOtT6oTrtA5AXGsc=;
	b=go0zwiO5pLFF61UFqOTY5pGo1A7aShtV+DxXi4iIbF3SZCN33b6bw+irXm5DRf0Xn8xp
	 v21t5AnxnuY/9D7xzxKn5NxVC1bL5DD/xQ3MgfuNY5bNBYvBNfn2vnALO7qJNbBEMMAYL
	 gYNsZtvTebf7Bcn6l591Yk4Sw3r99hcozIGAdmydOso41df1Y4lNN3ABTIdBRRMtoHA/S
	 YhSW8aZIbprvI34txlwLay7M5mWgcvVK+dv/zUrxuGyajVDJswQV1o1VaCTLcifQDuvKx
	 nDLFQPtU5WJjQVu0qDxaZjiserTz8sMRmbJ2TJ+mv+4Ez2+AtNvvmtNkF5vYzqkGjPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YTofFLaf;
	arc=none smtp.remote-ip=209.85.210.99
Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFD0606A325
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 04:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFD0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YTofFLaf
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-843cf077f10so2057213a34.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 20:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285573; x=1794890373;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZTaaMQzGS8QNSoGQ53tnXJ4N7sHJOtT6oTrtA5AXGsc=;
        b=QTK4A/IiPXPHe3wiiv/Qo8f61g27TRBwNGYMcFjzto79Bf6WxD/sqFxxEGbRWDfdWC
         lIreytGWxBTf+xFWPRFvxxD7WfAbXFJu0CALx3o3QcaXHD6aZ88aa4rkVrp9cc96JbO5
         98m/M332IJMC/By506QcZnXyEvGVVVaxruornmHA08rCcf4X54Z0LbAMwhe+IucShlVz
         Fcl0Pkg/P7MRuLTRpbw961pIuk/lBcUalCimPB2gMiT5oGrcweJR0jEIYUbvJ35OXcSV
         Bhbu78/sx8YmEIy23RGIolg1eX/pZYm6VZ/pvBTl7vwU2xBajy2u9SNYFIYNLpNqAUJc
         rG/A==
X-Forwarded-Encrypted: i=1; AL+hErGH6uNICJzNADzMxjthUG8or9VuGAUd0hrXiZKVP4pRAYQ+vf1MT5zpQ1xx9So6O6ibKy2a3oKEMkKU@vger.kernel.org
X-Gm-Message-State: APuU4Z81a9t/pYH1/d9tPOF1TXXLgJpwHnVdu7TmK2MGV0AaSx0exnMw
	pyXAsrqKRloiNufMULHfVWRX/fJzOMUunSR8rUrGi51INTVemoC39OW4Ys1bdFaevn+zZGQuZsR
	bHJilgg+zM4Ka35LLQAue6kGAQcB/9hwcHA0mDVo40G5ikaylr1AHY95Dmd2oSyVGpYN0X9WlqA
	bjMTm9HSPCAJprRZumaHuIV2THSPaN3VXTERz0POAc9QRubcTH0YF0xBI94jpp1lPmnxm8J307G
	aRWgbpVJRDTKll7eIMD7A==
X-Gm-Gg: AYBFou1q9g1l0KQ3vbVybWAtYqUlbQIEmm2RTkviSLE3oQ4xFIoTjP2n772A4WfcyuT
	eH+0CshHiXZPsNGvvBpvp8USRBQygLRzQHfdBduTUwSBf8ZCOr0XmoevxITOVpZfeQYDez/Fmpl
	B7EaEzr26+y9TTuuxxMsJTn3/L+A1KbgaLliHlYicVC5YlyLGHlyNihjgjiNMRToNvBtQB7yHeP
	QAZoylD710vUYsTVCGXcphUbUIFFi2roSjhp37Wzeucm/zaY+gWdl01dXSHDJO+aE8ZMyQ8S52y
	S3dfmoc1nm+R2HpsDQmdxTaIgF4Kuh4vh37XFuEMheWus7kBAqln0wEOqQWVNwTMsi1p0xFZE+g
	e5X5T7Igx0QEj15wB4vSHAFnhG/fwd8yAILSkqODxElfs1jkFYsUO3hz/WqiDUdXRv8GlxEa/rm
	6ldzL/sePkifSYaufVyAmXyZKl+4QGph+zX47N9vCh
X-Received: by 2002:a05:6830:314d:b0:81c:a945:60b7 with SMTP id 46e09a7af769-860dc63649amr1358526a34.2.1794285572751;
        Mon, 09 Nov 2026 20:39:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-860dcb8f865sm12531a34.3.2026.11.09.20.39.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:39:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so857683eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 20:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794285570; x=1794890370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTaaMQzGS8QNSoGQ53tnXJ4N7sHJOtT6oTrtA5AXGsc=;
        b=YTofFLafwRDlrOxoYwhV/HcHf2FlSAVCoau3G2jEYYTSXRaro7btfU9QIKGgK1g0KE
         uVe4TQjXluXoirWvpcMeR6WUWwqHx3+UapBdXhJ9fPGg3/e5A7wcsAFSp/jl+faoPPBf
         9nvuY1xYpuLFTF3XMo6iVBD5dDX4wBo6Z6a0E=
X-Forwarded-Encrypted: i=1; AL+hErHy2NmhBREjb8jT1cDASuZwGWg3jupmlYGzw0f5EGk7Vfb9S16/p21J3p3UW79WYdh8Qm4IpMf6uZIP@vger.kernel.org
X-Received: by 2002:a05:693c:80ce:b0:372:1be6:110b with SMTP id 5a478bee46e88-3751f0780d9mr1623967eec.15.1794285570309;
        Mon, 09 Nov 2026 20:39:30 -0800 (PST)
X-Received: by 2002:a05:693c:80ce:b0:372:1be6:110b with SMTP id 5a478bee46e88-3751f0780d9mr1623924eec.15.1794285569697;
        Mon, 09 Nov 2026 20:39:29 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm3604548eec.17.2026.11.09.20.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 20:39:29 -0800 (PST)
Message-ID: <5766e56e-b98d-4df8-9378-4efc078ef1e8@broadcom.com>
Date: Mon, 9 Nov 2026 20:39:29 -0800
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
Subject: Re: [PATCH 4/5] gpio: brcmstb: don't turn platform_get_irq errors
 into -ENOENT
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org,
 linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, geert+renesas@glider.be,
 andrew@codeconstruct.com.au, wbg@kernel.org, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
References: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
Content-Language: en-US
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
In-Reply-To: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/7/2026 12:12 AM, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> When the "interrupt-controller" property is present, brcmstb_gpio_probe()
> maps any platform_get_irq() failure to -ENOENT.  This swallows
> -EPROBE_DEFER (the parent interrupt controller may not be probed yet),
> so the device never gets retried and the GPIO controller is permanently
> unavailable.  Return the original error code instead.
> 
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

