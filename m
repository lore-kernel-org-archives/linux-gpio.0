Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626062;
	b=pmQ0eldSPmJEfaK0ZvMl+h81xQKX2yTIaARY7G8osWrc1lKVFP++bRDy89/ZT8QGp6NK
	 6O77/xPZK3rDqZ3wMvo3jshDJ5ETjRqVbdBeHiPz6U8hbRjdcHbOJ+z3Pu3IaRuD2eVKG
	 2+VZhbEJnLgFhEb1IQwHc0TH/x4FOKMoQGHBoVdWuAvKKHdQTqNnlWWVvyVJbLK22sXO3
	 fo5a6U2ChBqxLNW2OU6KCMre0OoPT3b/yQ1v3dwXoL9hUGldgmEBB6O6zr3aCONfLbXfH
	 oWznIVvZJc4dVfZrZDLZ//SGJK/Yu4wnZaNo6LD3tvkUpTVZSG2K2G6U0nrES4wNVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626062;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=wJ4LhvZqqY8UbBhqAwzRVVah7EqIXTb6AUHHg5yGZp8=;
	b=F+ZI1LQp1wWX7wzAyV8V2WVrheAYF+7oQa2XIedCRHo1J/PPHAJR9oQ3HuSxva2QAb9N
	 uFm/y/icvM6hl2x1W5oOT7AR+tNPqkMG6ek1eYw+2LBGrZHn6h4CUS9ltDRaDx+MtnkhJ
	 TiIuND9G2BGrkA0b71XJ9piOmNTokScgmszZGZvuMxDyPvSojymjAJizQXmu2OnrojNPb
	 i/CU44eH//rGcf+NSSODOBIOpfiMyPqisfunsdMYbXvL/+mH+6mNGlqTwbjYvZsIXcqXM
	 AovuBdhDYQExMuaeUz7N9VobuCrJSdFqVZL/1PqUZZQ5lGIWfSIOb0qGt192R/N0fIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=ico5ogXv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=P3yh2Ytn;
	arc=none smtp.remote-ip=103.168.172.143
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF74606A323
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 17:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF74606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=ico5ogXv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=P3yh2Ytn
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id A002C1381029
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 12:01:00 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 12:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795626058;
	 x=1795629658; bh=wJ4LhvZqqY8UbBhqAwzRVVah7EqIXTb6AUHHg5yGZp8=; b=
	ico5ogXvJVauaAsGnqKHzXbfGMNtq6TPW4Wti+o4V7+0obpJsXj9BNBESqXx6Z8z
	4VOX+5lKyE7hr+eOKxLzMtQRKsdsjavf7Vf5rmxn/o2Tv+6w1EicDxsT4kKiQB87
	whB5S7pvXaWJzi/vJa6PKt8hHSK15EvvachbjuPBM1EyrbRd033sJTjUOPNhAWWz
	KM3zbX/ZkL0v7bdP7NSTH2gxvEYxygX/aEDRubewBXixycViT3KFqg9Y2huASq6v
	bgjbw8MGI+s/y3YN8DqcLcLy1k4fM91frQVakFpUsWW0P4omJsFuU6ZIln0ZU/RQ
	rGC4XWQQZiYh9/XOWYlC5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795626058; x=
	1795629658; bh=wJ4LhvZqqY8UbBhqAwzRVVah7EqIXTb6AUHHg5yGZp8=; b=P
	3yh2YtnOAkF7IS1AwpziEumLimkIldcBcvb3YMBnQ9Sbri1CHOKR1V6HvcLo3WYQ
	/V7wddAkbB1YWGiqKbGbuP8ZDUZqRCN+s4a/fjgO7VN0jooLx6JnUD5Z+3Ric095
	Bsh2AoYAmb47VgRPw17V1V7KoSs5Z68Lo1c2jYB/Q1DaA27GUJ4S6FjTuIAo+Grp
	MIix49ZYmoGDfFKLB24vSuHfPANED/semOp66Bu/YO5FnlLaQGSWphHryxfDc/vF
	SUDO8BkySYsLgv/RkVVT2C4+4tqS327a9kdMAVIF2GW5sgF8uq6Wi1KScbV6S+25
	iwGPlWJzMI6jGtOJb1BYA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795626058; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:Aq/GyOqmXDdUTv21slyQfMvLetwTpEU37EnwZLIIBeXxjGx
	NcVtVZBtQD/+UB3olORvxrF3Vk8TKS8YZHg1NsuciiWfMH0Oy/IPxvGfvFrf1LWo
	t4idtz7pb6D+NVQY9SbV1uIPpOc/v1GG6xg6qnjNTrOUcpW+hVy7bycdeu9CsLsI
	RvDgGtdtbGTa3HR/ZaALNeoDSJWXU4RgngBl4LiFycGJUFy/b2YZQg6AYnC2ojfC
	hvw1kU9K1SzyO+34etysFhNE6O8HQsZJA0LgHD2kK4xbClQp0ANzYnE3HbrFSbwH
	/pHFjMJ53pCzF2DbgmIb/ZafX/41vCzkXMkYzcg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xJ58VRc5LlEDH5o7tOgsmtxJEwdWZ9FiyVDfOSBSYVA=:6lVmZurQ0Ave5XoxY9O8lzq5TuUCBgamo3QkP0Zn5kw=;
X-ME-Sender: <xms:SBQHa2qF-Luh88RyPZys_vqHhNjaYcBkUSijCivR9dzpJPSUxmYvQA>
    <xme:SBQHa_fd9BWet9QNygudqbeV_xEQV31YCDj-silgs568HYrtWaE2SJqC3wGvcL406
    MvUjmL1y6VNE_97br7IqsZVM02ka9ds33Jtoie5mtIFfslHB7nKL8hW>
X-ME-Proxy-Cause: dmFkZTGwfXy/CoCxb29kAq0yniJj7+9ODcxgUwp3/l4Ac1hX1tkQtDdqP6qaTHcK9NhjBw
    n6Rp3v3rPS1K0Dfv+W2b5Kp0Y3lM2fFAB4lG/YthsktuuHkpRiHI70Twq+rHEQNSltg9kM
    4/xbVODOE54wtPVounOA6t+IBqZqchlauYq0yjMdbzuX80Tir/sD9ksSrvTDwCyDOZi20X
    V1v5WdiN+V3QNGx/r5tspRXsIespy4zcQt/zRp1M1JANhWVm9bCm5A9vx7adVqqODxI51x
    OxX7xt3hCVi+kme1xEODTEmxGswo5VhMrLP8KGgZrIHu2Yx3ycN/t+QkSi5fqExwZ2uBtY
    GGMyjGVJ/qlSn/dAf709OYgiB2FDB4GN6N7/1mVoPMePMTWABmH7YCLobA+/Fksl/VLc9e
    R8YzZRU+1BbVHCWUdd2NPVAtWJUH9g9nFOhiQThcxO9O7fLAnjDTObgD+Lg6Ob7lgQZQ7z
    WpCfx2Toc84d3O5eNBNPN3H6wFTz52eTeUzQzGdpu7cpVOgd1vyHYvF71VxZe88nRwmSU2
    CsU9YmBIIFYNtYpxMX8sbEi2+CIXMZQb25W4csGcm1uUDYgvn6BmCMpkmfDMk98Nv+acMM
    BzoaJfPBUH2rqfBqNz0wJSrniYCUI/y3VFvBYc6NLmZuYBM7PWTJlsBUIABA
X-ME-Proxy: <xmx:SRQHazdalclFcJRp26Dpng0asjX7ywYqqksDwMEDvgoGK8XaT6p-HA>
    <xmx:SRQHa84Uytfo1uk_jlVahARZC8hUuPav4fTNFfZWBu1HQDl2fG7WkA>
    <xmx:SRQHa2VKZ4p6VtZsqiLWQYMfwLYc8_aCVMRVP7s3BS-XIfba66k6ug>
    <xmx:SRQHa77a2snD77CZiz-keXF00LdvzfzBwMUYnLCyKva0-ASkMvy99A>
    <xmx:ShQHa1fFBS7bYApGueQ8S_ND2IdfsTCCFinjkirQacPYeAfLEzCVVS4i>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 718A9F800A1; Wed, 25 Nov 2026 12:00:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AvA74aORy9iR
Date: Wed, 25 Nov 2026 18:00:36 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Artem Novak" <artem122novak@gmail.com>
Cc: linusw@kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <835b2097-33fb-4361-978c-e591384e5a07@app.fastmail.com>
In-Reply-To: <20261122174427.276446-1-artem122novak@gmail.com>
References: <20261122174427.276446-1-artem122novak@gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: fix typo in RZ/A1 driver description
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 22, 2026, at 18:44, Artem Novak wrote:
> Correct the spelling of "Renesas" in the RZ/A1 pin
> controller driver's module description.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
