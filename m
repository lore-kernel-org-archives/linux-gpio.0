Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409350;
	b=Wnm+AwZ5LtPwOEh9i318nX8RoFVbmh1/0LiY8bIXNGlERKHjE6dgKMlV/7o3UdJhWrtz
	 AMQy3cYA8XtLzoS7F+EUkcGLKo3maajSRMkXQy+46mEECp8MYbS6TeGG6MbxS0ZEW8CI3
	 iyK6E4fgGe7OgXDqsyilD23qwzrzdOLOgyf3FEWagl1TbyTJm7Qemwp1sVVi+gcL3A12S
	 PYOyy4UqYoaDMSqsuqJl6WkAAyHihSByD4QMWpM65a2+0djrbadJhI8NbMNkaOcjGAwJo
	 k/9fX9elOvl4SVxkY5nynck8eLUasMoUa4qjXRxDr1/bYl8VQI7QZ4tvQfGHECfFcBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lmylWoSBcjoFdbnnC2yXhAwKd9dExj5cQI1Bvjae/xM=;
	b=WWnCFAlts1LG0IdLgzaR7RkInmape5NGmPeRYeWbAcEtnFyCsoX5gGd4MyNWMFYhS+Mt
	 i6oPSkkLsXGV2oJuEV/IwR6+YqKQxMRcdOoCi6k9RBM6oZOqCE1tvYIZTG5JytIlo6CDD
	 wgvr3SjxiDrnDfIdBhyXNcpMCHMoHdFfIqnfsIMbAZz+9Hp6dbXcNdiLD8ittQyTgPPR0
	 ZQbLmSHBju+upklyO9psRFSGABYuDUpzGKTdGnSgG/d/viYW3/l5yLbQrQn2la8R3IMRy
	 bKBK14ZCM5nwFWzcp6+1myprzvl9l9a5/OTYIkanHAbD1+ALWIUyX+T/JV7tknVySMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV2oKj86;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FC606A338
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 15:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77FC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lV2oKj86
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2188532f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794409348; x=1795014148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmylWoSBcjoFdbnnC2yXhAwKd9dExj5cQI1Bvjae/xM=;
        b=lV2oKj86b+xYFtqr8A44TZfibZOkFAKibDBsIgxGfdlp7zekATSe10jMxau2SuDNw/
         lW9uq+mbvvcHhIUr/ROsAIHCMw8LL3hojR8wKa4jMWX7473Y2rs+X6Bujwys/jFosKkF
         hEtdh50Gq7hlJt93h8XgMomMVA0pa/1RE5HOx7GNHerdftgqpjBWDy0wzkcuMVEO4Ppj
         eJqAz+TFldEO2YMPZDnbFroqnvYIb5mzWI14tnXafPm4kYycivxTLgGtLjUtQAWcokbA
         H0fhbDrSZPtX5Qu6rdZhxBp5rhNEbxsF4mB+/s/4X5z5lUUgLDDwxXQnyLo8aF5j5tTg
         8PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409348; x=1795014148;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmylWoSBcjoFdbnnC2yXhAwKd9dExj5cQI1Bvjae/xM=;
        b=xVqSSAw3BbefDvpKwY/onlmlOKyvUKZM5ThYcJW77rJw41U3f7Gc3p7Epk1VGDATD0
         shd2pBpYhk+4KCaYsFMx5BwOTc3Ao5zqy8nCiC81hvHaM5DpBexvAG5U++EuVpw2wSjh
         HJSxkzVDfzYttIvS8GGvMqFRtjFYh/RSKCb0VbSoWUV6uRE4wI9H5NTq+cyIgxdJFRtT
         79jPyfhdL8rCfo2MulVtIHbr41d6/FOsGtKFmu/ZFYx3sLiNwuV26TuWFCgTwxeP3qyr
         2EDSehZTBjkm6JkWeOpV3R7u728mDMw0cc18umynidc/GUiEV7Ym1bNJX/RIpy0/L4OT
         s5hw==
X-Forwarded-Encrypted: i=1; AL+hErGNNQrBegDSbRqxXkUvFJ37o9X6AbUxss07sJczJBY6Pk6mev/A81FD+OivTh5cGJUoOTY5d0K4VMdZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+9ZFHMLuyTkN22zOt/FwfwLbysOgb0HMyTRAkbz2djQJS7pOfu
	1gPdlHcMJ5acEosYT5aHdNuFSwxYU1srYJAhpcaw/0zamvYihU7lRuHj
X-Gm-Gg: AYBFou2QwwOvR68nXn7QINlENTp8BcM1CHwoJ/A9SSwM7+J+ZhCJyI+i4c3mNswWMuN
	1FxFA9mMwA1e54FoGnfBuFTNw1SM1b2+GLT5NSitRISv7oeFXlPXWOaHBHUp/Hcd9AeFyTY5syC
	ePBTT7xRSPVW/ACRSLIoREp8VQrIx0qXKNydBWFUmfcTmX+ZIPmPtItNOUtbqyY8qM8kyIBlm0r
	w5mF9g7YXICpXN1dIYZ5Fy63o/ULkCPHNgwHZ+1HgcK35qZ1g5wbFwvKggM5/IBiXMenn0kvvX7
	3uyTbXKAm0dxKBq1Df9hGWMajFepc22mzW0XopWAbh1Wdabb65jVSiFQmRyO5JWpXXTqP6CvBCN
	Ui+rnPrUxSZjhvriKGrsL1UibGMhGclUe8Hls9BA7nq4/GpnYOR2u3BtG/3Z12O0VvE9LAIAKSG
	LDbnVuEyOjUlYdkfYvF+wyxIzjEgC4LbwCM57HGk+HHutHAxJzFZGsbQDymnTrOUzw1hYlth4jy
	UaZ0nKQ5WKVJqhXXsXnCtXvcKCtWT3vzNJd8OPllzGm7q2lQ05OR4yBI3AsqF1+9MTPups/237c
	sStacEFB1CqMqXZg3mZMUAG55U7bnRykzWg/up3bI1UNEtcpB/nRiU8yslAeLoc730TEMfP3ykc
	0UamiBUWwWEvCzzbW3t/i5QzY
X-Received: by 2002:a05:6000:25c6:b0:490:f775:b00b with SMTP id ffacd0b85a97d-499c7552647mr4331095f8f.52.1794409347645;
        Wed, 11 Nov 2026 07:02:27 -0800 (PST)
Received: from ?IPV6:2001:9e8:f118:9201:bc72:ad54:993:306e? ([2001:9e8:f118:9201:bc72:ad54:993:306e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm10669151f8f.29.2026.11.11.07.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:02:25 -0800 (PST)
Message-ID: <1c42a9d1-643b-47bb-8f69-0ff0eebe5d47@gmail.com>
Date: Wed, 11 Nov 2026 16:02:24 +0100
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
Subject: Re: [PATCH v2] gpio: line-mux: fix unsigned truncation of property
 count error
Content-Language: en-US
To: shao.mingyin@zte.com.cn
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261111173546439alUdLx-iD6-ISoa9jqS5H@zte.com.cn>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20261111173546439alUdLx-iD6-ISoa9jqS5H@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shao,

On 11.11.26 10:35, shao.mingyin@zte.com.cn wrote:
> --------------------------------------------------------------------------------
> Hi Jonas,
>
> On 10.11.26 17:07, Jonas Jelonek wrote:
>> I think you still need to move it up where 'unsigned int ngpio' was
>> before for RCT.
> I read RCT as ordering by decreasing declaration length, in which case

I understood it as plain line length. Not sure what declaration length really means.

> `int ngpio, ret` after `size_t size` already complies.  But if you want

with 'int ngpio, ret' being longer than 'size_t size'.

> it in ngpio's old slot (right after `glm`), that's a one-line move --
> say the word and I'll fold it into the next revision (v2 already has
> your Reviewed-by, so I'd rather not respin just for this).
>
> Thanks,
> Shao
> --------------------------------------------------------------------------------

But probably not worth to respin unless something else in the series needs
a change.

Best,
Jonas
