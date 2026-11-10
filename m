Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333360;
	b=ajYduoFOOn1OrhiCfkK5BA2cw7oHPAi0y5x0Bbw9wfwVAOunxbv/Vkl84ms8UgovJxuf
	 3gF2NNB9I9hKz6yJ1NdiWQafo3gTj+KGcMt5vRpzWEfCM1f1BtqeUNQvfrGYPDWU8zlYj
	 quVTRYx9LIOrqqtrRH2O/aSBPvnecBNzL+9hcw8QJiQFRkmo5xpbMPSN+c0rUBd7JUh5j
	 mgfVhWxvHAsORLFAX3CcCX3XBgetAu7sl93adHia43RoyhhuK55OhpFa5iCI372KJff6e
	 YaomUmtUVEd56Avja5ClaUJrwkbUQflipuxC9ThdfCaZS7CPM1CRgE9W4TgaOHHCTWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333360;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
	b=uVc1MarMQHEnneUYAPlBceeFpsMPabJNx2XXfj8dRCoY0yZ/pghdhLu3E6PIBdQJ/TqX
	 DYDKvcvVkWvZgwlaT2lp05yjniIjrJUXsqmhQowiZNuOqj9WH1CUdmvswSxWog2k6q0yf
	 rtkgwdQCnY6Aj/c2iP5WKU7IvcE6I/5uChED3jy5ZWEZPf5g/gmrelOij1W3GNqi7kt6K
	 v9aReAXpj0mWcoENN3K2oRi7lPSolfOocPBszFUTXhtgxec8Ho+NW0TPGxAHjSLpcuXQJ
	 DQV/il0kYkGvdp0QS99dFmdt8cWkfxHAYP5TQ1AiWXiMNVOviP5bzsbZyr07RkVbKvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=axodgojd;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BF606A206
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 17:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65BF606A206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=axodgojd
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so1471732a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:55:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333359; x=1794938159;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
        b=xgX7ICYsGolw8VGJB/32wG1M4v8Oj5OfzUg5mAZ+/ozt+GbzRhvTN0Rtxc6Yq82PX8
         HIYWXNpC4SNauCUBEUFeflrGngAEh0JUfjcSnBW8PM/2K97jdkGLJ6ZFD6iEaJo1SKah
         EFQequXpDSrGnFeKw6XTGYMOAsexz+THgn83hkTsbOnYDVal83w2dNwJjMNVSwb2XWwP
         mG97jguLjxWd4VN7HMlcYEPINogxH439G6aLCV0yNzjQ76HzTte6HwCiEMZWHqXSLedL
         283m3UzBiWOmdzg41XQ88kJC9aRZvsPXdOgFd2CYQP6H+5fiJYCjx8jLRFrctgXJXS+C
         mnbw==
X-Gm-Message-State: APuU4Z9VQt3zSh0VU5EwT63zVsjyHVKdhxLR6P0xdFCYK915qeCiGKXD
	Mw98p7CPvlERSGA1N/ZEAN8xk2blkQlQcNi9A+TCQwX8pT3PdYRZEnOHHPKyqWs78/3wpXXV+8s
	QDIuH0/UOuufLD+NvQEksf7LlJSUUd6rmrLoB94QRC7CkRs7Loy8cLwZCi9NP0NAHzMFuU+wRga
	0GJR7cXtQDuq46wlm+EXxAtEvWGp5pzKF9ZIHSmawuwuPyk9MmesKQccS5H8nL7rJ3G+y2wNPa4
	k5iJWkwGU5rI1Pcnp9H8g==
X-Gm-Gg: AYBFou3stNmLa091/dYvEztQfktB2VtLpw/uLLlxYUb79q2bCj/bFHmQvb8q8PEVPp7
	v5UhKHZYW1xxDplHK97T7S00FT9r9KM2vCDk11ubzntptr0hKWYeiH8qimhLfA7r2wo23rM25Wh
	aicD8RT2K1IHmNxn+tbGf0cwEM7jA+XvPxtsFfDt63fzcrLX1o5rl8fQI66eAWoC/Ibcbk9heOJ
	T4CG3FPOBJTTbHRDQPJmaAInmzBaCdSTVZudJX6FDNqtlpsjzl7OrJ2J9mmYPamV2yDLqO5BgxG
	OrYfg5REFa0FHK/nj0h/Yy8ODVB+PkZO2KK12MnC1muXkR4f+RlSHB98eDLmOYZUnGyl2WEtsMD
	ODwBcx1SkO+EFqrXwOfPRmgWwLOpFqBnLpNFrZeN+x4CnrTl+UPOPrLoxSvzkpOaA8PiZzlvuBE
	BKK+or0VnIoO3b3IjoC2mDbTagu6IMHosqvE5JwDbV
X-Received: by 2002:a17:90a:d647:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3b166ac9df2mr3579973a91.6.1794333359021;
        Tue, 10 Nov 2026 09:55:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181c0c98bsm26907a91.3.2026.11.10.09.55.58
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:55:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364605e74bso60534441cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794333357; x=1794938157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP6OwSI+1Wre0VEzzZm2zMPMAKhlEWllUd0msDEhg/M=;
        b=axodgojd/vtNc+GFbaa5K5Ju/iMG9ncpz/v7PgU9HXaMyhno/64jpwDoEaxzA+gb7H
         6dtJ2FfExaW6wGIeB4vKGrc+EL5eL0MS23kN8WjIbc7D2b5yRvt2FHt5AhcAzyAUwWNP
         ttJwl5YN6nxSNw88HZ+JVgkvM9hp3tV4n6RXI=
X-Received: by 2002:a05:620a:46a7:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-9479f387c90mr537592185a.47.1794332957066;
        Tue, 10 Nov 2026 09:49:17 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93f:24d4:ecf0 with SMTP id af79cd13be357-9479f387c90mr537587785a.47.1794332956564;
        Tue, 10 Nov 2026 09:49:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e7f3bsm277453885a.37.2026.11.10.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:49:15 -0800 (PST)
Message-ID: <d18fe81c-8762-4886-b3d8-d2b7d9898ed0@broadcom.com>
Date: Tue, 10 Nov 2026 09:49:13 -0800
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
Subject: Re: [PATCH 3/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 brcmstb
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Bell <jonathan@raspberrypi.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-4-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/5/26 23:06, Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> pairs the callback with the pinconf_generic_dt_node_to_map_all()
> already used for dt_node_to_map.
> 
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

Similar thing to patch #2, this should have:

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
