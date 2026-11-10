Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332929;
	b=CsDl6DP95l5tkkbwRICZafYw0g5dR5W3ZAmp64JY1W+XNlde372OGfVMSbErT61gZHWD
	 /9qBS8xyp3oIH7VxgFMUMbFqEJkoo3L7K9FE2uhaKT4wb0rj/4Ha3nF4tr2mKUcJFYoox
	 KMFemt8ZHQ7Bq6vjdstYRJrT3u57zhUqGcoPiqQ+CGd6CMt6erdU8XhHUV+NgnG0UsZPe
	 IkdQUMSeVezpINClJY5PAG8tlgrQ2bAsprW7rTly7dmuQqxq0fjnp2qxLTAFQNFor81GJ
	 6KNft332UmKNj2GupAe4cPr/+fY3+aKs9HQ6/tyON/1xvj6NK9SXsc/RwNNHAe4jD8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332929;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
	b=BVhhGkbBCEtphk1GeV8PfO2TTKINsl9JYsMR3BbMKXv6CgKZUYkqkrK26qbpqvnY51pw
	 eblKJ6IeQ+t7j3yrQPLU/TK1dNmKndQ0vInlpFcrH3h7/sPjks8XdJZH/qpAEyVeDoKvF
	 Bju2UIgossI5dJRzp+38/2jfh0S+Mg6BIjFGcOEXO4v3f7Tuk6J+SXQbpGiQsV+rhbwEJ
	 qCDjpHb1DxdLPt7+OIL8Er1qOgYiOvGyDAMUfMGX+VZzMSBhV832eS4lmEVfbcx/nTMLf
	 Ww6VExc6AbP6zws7ok/PDshrXO2FQJXeuhJQWXON9YaGVvzuakUP629DNOuvQzdYDdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="PVaKD/XZ";
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A3F606A320
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 17:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A3F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PVaKD/XZ
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1482457e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332928; x=1794937728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
        b=qNgRx5hysLCcc50KKvXJv9QYwpHwd5M7qEI+oHdKzOuGIlJXuBYjzL/TynvWK1NXOL
         IXsMRW2VPnEhHkANzARg/WUcgUeUKOCarSK54OmoU8EQqEUlaWNgn1wxPTjq2r8wgS5r
         CoCkDpMTWNnszpTBW6w6o+y38x9lYPCODj1t745QeOwOgFtj6h2Fjg6RYmGxcfpRVFns
         v7Lb/UhcKfX6Tzk9NfwIGvVUQPl8au7GJN1D0HaNchzp/aWrXjYCb0nidpJ6ljcTnoGl
         p7bwTIRDpS77vhx1ma1c1dACFN6CbHOUPSs+c6fqzrcy/UU9DofAFqog7BUbr8ZLUfq7
         jmKA==
X-Gm-Message-State: APuU4Z9O+9aL5ENywQ11dQXMRwv+WhExffPP+QH9bitIT9cmRj8CeVrR
	q24DQeAFZNXcSv7u3yPdh+eYKik/gHo8hD42ABvKfaM4XqOgOC7IdETsRhcT1D1+rrVEvVHyzGz
	G/CzEmZOHBJVuGOPYVUmzVPvWfRH7rE/KGIqlXHtLWAFOAA6XluPWXDwNmQONDfZzzmSgAkh9HC
	daOWlyz6mjEoTStYnsHSK5ywrE+OpDL8dkeOzcRWTvLvhwcZqHZ03hQtcsLHnLqGOWX8NThGbw7
	8A+oo8gx6zQoGsoPY79Ew==
X-Gm-Gg: AYBFou05srLLb0y3PhllHfUnLH4j3ok49craA6Ln0/Dvk4PKTvyZIYroaUqfawX+UwL
	JPz9qZ32Y6MiwY+K4yVZxUVgE4t34rEDKFFdzqQaaxi3Oy6Vuu4MfGJvWiaRJ3drBGjf8kTToAY
	hc8lLSbeCAVZJvNixG+F0coRKb5BFPLQ5fCrhZrzM/yvyPXquv3Kt6HfH79cWLCpah+Z1NAJ+fD
	SCj3v74mfn6NX1z/hfeFJ+TpTAFCDRP5pOp6eEe+eQBWnCkfJ2kR3WknO1JjhhtO5I59kSDiuT7
	XIDXtf9VdtMwkrPe34dy/wRyfXgies/pbv6gkBf3YL/Mn4YyHlH78WXM1J34vQflqWuqUzJdYou
	yty8fISBzxxKdWrdVftBqzgIDMEw4a/6vFgSK+Q+QWgevBv/UpB0BmLRLReWm4fBTA5HPbh/HBW
	SkA89kG1n+4F6l3K+ix7jfCFMZtYsgYcQlEsRhHcJo
X-Received: by 2002:a05:6102:3910:b0:7c1:8aa5:36c8 with SMTP id ada2fe7eead31-7d301c3ff3amr1365287137.36.1794332927773;
        Tue, 10 Nov 2026 09:48:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c203a5586sm177795241.7.2026.11.10.09.48.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:48:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso1981107a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794332926; x=1794937726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ko07PtYbqxmJFL5eE7O+1z90SoFtkrR9tqYTOjJdR/M=;
        b=PVaKD/XZv6dd9+toxjk8tcIpq29wMV7Ym0U9Xl3kttsQw6mWkXTnJ4EBJ8H8W1l0xQ
         cmbfnw5C65SY5oOdKDGU104CkD8RMVQxia8ofiT05EDSfBH8x3EM/0DTidG/nSgUwCEZ
         x5odETCzYbkzIxUqDwnWQ1N0uMgs1L/kV4WGE=
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b166d03802mr3219202a91.40.1794332925871;
        Tue, 10 Nov 2026 09:48:45 -0800 (PST)
X-Received: by 2002:a17:90b:1fc6:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b166d03802mr3219189a91.40.1794332925425;
        Tue, 10 Nov 2026 09:48:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d550dsm566282a91.8.2026.11.10.09.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:48:44 -0800 (PST)
Message-ID: <f24e21f1-3bd8-4682-8393-ec6aa6c1b232@broadcom.com>
Date: Tue, 10 Nov 2026 09:48:43 -0800
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
Subject: Re: [PATCH 2/3] pinctrl: bcm: Use pinconf_generic_dt_free_map in
 bcm2835
To: Wang Xiaolei <wangxiaolei01@kaihong.com>, linusw@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com,
 iivanov@suse.de, andrea.porta@suse.com, phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
 <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261106070628.1428691-3-wangxiaolei01@kaihong.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/5/26 23:06, Wang Xiaolei wrote:
> Replace the hand-written dt_free_map callback with the generic
> pinconf_generic_dt_free_map() helper, which wraps
> pinctrl_utils_free_map(). This drops the duplicated free loop and
> handles both CONFIGS_PIN and CONFIGS_GROUP map types.
> 
> The error path in bcm2835_pctl_dt_node_to_map() uses the same helper.
> The driver already selects GENERIC_PINCONF, so no Kconfig change is
> needed.
> 
> Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>

I think this deserves a Fixes: tag because it fixes a memory leak, 
generic allocation can allocate PIN_MAP_TYPE_CONFIGS_GROUP, but the 
custom callback does not free that allocation type:

Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl 
binding")
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
