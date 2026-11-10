Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321854;
	b=ZKpspDeCCYdwIBa5G/6GrXoK0bBlCYS6Ewx9KGte1eb+Al0MNUacBr9ZpTDxz9dqdHeC
	 FjLaTRkh5f5FqCprgi7iE/ZjZ3dRm3+VjxkYXblgZgDXl96w6M/5cwFwP2FoqcpYSHjC6
	 K//cSYF8Rk0xcMCIeBYx5ur9Vnt1llAMrCM+YWHpcw6urBXdl8jBUviJaa8im0xtrmOkC
	 Tqs45RRT7N7+jtVq5cUDxX7Pmo8iL5P/fuRkgz569YBb5Pz2jwOIDZHIYp5jzFpRJHyWO
	 bXukEGSHZ3np3lUiP0IrnrCRTgsszeZFBKqGzmNUqFXnjLyWYYPn/31ptN3P5JhWztg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
	b=KHVqhLLCanEmeMzqA1fApU8lem+cpBRRTLGbERO8LCHK0HBJeoJYPOiD84aSc6SksOU+
	 vg2cK/lrEhM1yzxPZDy1sCr1eBGIeLGw/AEUXPmlsEhJCFeWtt2gx16TdnDTntK2CtvyZ
	 Ds72r6U9kW8iafeU3htuGfRhztHMw4aZYaRXJUv+kgM+5Pe7Ze8cwfWe0BBwsKqo5rYqu
	 OyglqeOTYFSDw/Va99X7EULU6n1FyE6dmgD5LTjRLtID9nESmai+1vncrxdKQNgBgJnCO
	 6p3ulsPVPUzR5AMqK1IHSZxi+BZSbszcGQjUGohf/5jO2WwZ3YXA3Ob8PeRPQUVXFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jAI7mkNN;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4060A2621
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 14:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF4060A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jAI7mkNN
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1797526f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794321851; x=1794926651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
        b=jAI7mkNNr3iGaogAXzgrzjFkpz6l4rkoR3itlaI/74DFCZEcL5V2zkRp0eKdFTBB0r
         vapPeQc5/P7TWQtnIbfBrymA7FrbIjYezy/k4K4aYmYKzuRzIpIZUaqOB9dWWbZGzoox
         0blKviPrOQCw3QV9zwY7GQd6LPWWV4ajvakJ/OxOXMW5uhO9jVpliRNueGSPErXUbJRP
         pWO+TYp/YvWHfz4vvQze567g5lHubu3WVu0y8+58Edcb1XxoWUl0w0jVuSoXsQsbxp59
         DTFBTdu0IjtqrdThak1Yc/QWZmx4vOl/2f3ZvrP1BnGPZ5LwZG+8aj19zZnx7sIOQ/lD
         TUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321851; x=1794926651;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vbv4D0/LEv4X185FkFGCxxtMC7jQyoiuqvpgmuYpp78=;
        b=2QpTGMZB3ke0ZFcuFRqQ6AO38ARmOt/piY1SwuolKmtk1ONDRWCSYlmIjAcZdI4ZfV
         iga3C/wkiHg0xgVSDiP5FBsdRY5daqE9QgpzTUMXopvwUwH12Ot7DajLf9Wx+fp+mmEA
         bMPbcxA9eB5JktFQigP9UR7ZxaXNNARmiHgfc2HtStv7P1rKj3LA6ER81QPwmLaTTikJ
         Rf4Tcih55ntfjNS9mLDxkmOJmWiznFSUPiBLDwTSIDxh00+F+Kf/Q5X8fsfaEi+LXte3
         OfhqRpWOhiy4sktIF3dZLxD6xjt2Cjgsw3TT4tfraY1pdT+Iruh1kGjeBcSo9b3M3QvV
         1Ehg==
X-Forwarded-Encrypted: i=1; AL+hErGjLI2CeGavcK2++tFBxQA/hbC/ARXhPlj+NiJN7xcCUaZ22T2xoJI6wGJP3KYw3D/+WYGNEfvn2APK@vger.kernel.org
X-Gm-Message-State: APuU4Z989t9/fLZoCa/CbnwsGrjmsor9HoBlQvL4biQqqMD6E7kTeILp
	vIv7V1aAklsawBICVRzuGdBk6DAd+mFgnGJKKFfUIkqesI0Z+UTJR9M6HmHZW4edwe4=
X-Gm-Gg: AYBFou1pTnHIeXf1jtxqDCrIAEkAq7PGBifvE1EDcbnVAhuqN4X3kv8cHodm1ObUyNY
	A7NfUfDvCMF4TRp81Hq72gMYkKe7RzYA17MpnN3VeOQ6aSFoqPnPZDd8heukR1Q+lDSGuLEAAgw
	gHbZlxHLkUokTDZ9NohFkEDYoPADpez9m/tP/GMXrxuA6Krq5zfqv3LONbBO4gqgiv3OthP2B5j
	4hQjSiebkJSIvfVC4zl3pkcPRZavSou2w1D99N6fDygYsAUCMCkfFNJoFasYzxXvWatILXr+oxX
	445MXAyOHo+lGwrh0PgddlQnMB+7y7j2cRd9HOrwZCVxqdy9q4IFyaTnrVyU1ddcWnpyPzvO3bJ
	hLFsZnA2R78DXdhwUFBbA+VrMJcx3oWyuN/ZowI79tKTQX/rRh+wZWvT9GzyBcFVQg+zaSHTOCL
	6AFjH/bAh4Tvssc3fgcn/g2/fjMMlo4ayui7/f3mnxEfB2criw7uFG+4s8/d5yJwbUZ3JpODruS
	W5aZhc8LOC74oc2SiyzlxuC1eHm/fMcaOGXcrbCimkVyJOPnTg3dUStiF9o6ewOGvvkb/qglnLj
	/FEquzdCJDBWh5XwIXaLJ3qd91NsMFKqDiIMoG/qSY+1t/iGpNAMKkC77Q==
X-Received: by 2002:a05:6000:46da:b0:48b:e50:714e with SMTP id ffacd0b85a97d-498308b95a4mr3820299f8f.36.1794321851164;
        Tue, 10 Nov 2026 06:44:11 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm5439242f8f.24.2026.11.10.06.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:44:10 -0800 (PST)
Message-ID: <9ab69228-a9f7-442b-9a2a-2e012f37668e@baylibre.com>
Date: Tue, 10 Nov 2026 15:44:10 +0100
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
Subject: Re: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
 <avLxpUd6cXuqUCbd@pluto>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <avLxpUd6cXuqUCbd@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Cristian,

On 11/10/26 11:27 AM, Cristian Marussi wrote:
> On Fri, Oct 30, 2026 at 04:58:36PM +0100, Clément Le Goffic wrote:
>> The transport cuts a reply larger than the receive buffer, but the iterator
>> still reads every identifier the reply announces. Use only the identifiers
>> that were copied and ask again for the others.
> 
> Hi Clement,
> 
> thanks for these fixes...I'll start from this since it really intersects
> my current work....
> 
>>
>> Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
>> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
>> ---
>>  drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
>> index 42cb1aef1fe1..69645ce73d9d 100644
>> --- a/drivers/firmware/arm_scmi/pinctrl.c
>> +++ b/drivers/firmware/arm_scmi/pinctrl.c
>> @@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
>>  					   const void *response, void *priv)
>>  {
>>  	const struct scmi_resp_pinctrl_list_assoc *r = response;
>> +	unsigned int nr_fit = 0;
>>  
>>  	st->num_returned = RETURNED(r->flags);
>>  	st->num_remaining = REMAINING(r->flags);
>>  
>> +	if (st->rx_len > sizeof(*r))
>> +		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
> 
> As Sashiko kindly pointed out to me a few other zillion times O_o in my
> Telemetry series, there were a couple of missing sanity checks in the
> iterators core so in my last series there is upfront a generic fix
> 
> https://lore.kernel.org/arm-scmi/avLTkAtQQSzpgu2A@pluto/T/#me258191dd55db99d53b570be7c51901c31bc70cf
> 
> ...so we could at least avoid to check here and everywhere else in SCMI
> iterators that you have at least a minimum size messages to work on.
> 
>> +
>> +	if (st->num_returned > nr_fit) {
>> +		if (!nr_fit)
>> +			return -EPROTO;
> 
> My core fix above will discard the iteration upfront in an equivalent way
> to this check togateher with the rx_len check above If I get this wrong...BUT..

Right, v2 keeps only your check below

> 
>> +
>> +		st->num_remaining += st->num_returned - nr_fit;
>> +		st->num_returned = nr_fit;
> 
> ...why are you fixing and carry on ?
> I dont feel that you can safely proceed at this point by just fixing the
> returned and the remaining...

Each request carries the index to restart from, so it stays in sync but it hides the DT misconfiguration

> 
> ...the check is of course needed, but it should be an hard check
> 
> 	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))
>                 return -EINVAL;
> 
> ...because something is clearly wrong...indeed, learning from my current
> telemetry madness the above scenario could be due not only to a buggy FW
> BUT more easily to a misconfigured transport...if the transport size is
> misconfigured (as it is mostly NOT negotiated, simply configured) any
> message long enough will be silently truncated, so the fact especially
> that you guess remaining it can happen to be completely out of sync with
> the platform side...

I've seen your serie but didn't check such details. I'll use this hard check in the v2.

> 
> Are you fixing an existent known FW bug here ? in that case I would opt
> for a quirk...

No firmware bug, just the DT that had no arm,max-msg-size. Linux was using its default value that was not sync with my SCMI server value.
Setting it fixed it, no quirk needed.

Best regards,
Clément

