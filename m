Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954409;
	b=CbFWbkPTFkFrhBI5eCViqCZ7bVrjJg5jNE9fDaHf43B4o1uLHIV+rOdfZcwmhqI6U7vq
	 pQKiT/ElwrJMnIgYK3ZjJQ1KhIUavt5aPym5FEZt1Uy5RjL20os57BSxfwu7Fr3vz4+zt
	 xHxe5RYLtn4Q/6+wvfiDZ7QHk7jofQDDN/By5e18Rngj3pblhJbJE3xtJrOJl9iknNff9
	 MJ6w6rml7NqXRybw982hfMOYNkKbcH1vkjpDL3YMvcxbzIs12LZUp3CvwGBv7aT/mn1dA
	 g9aa6QwzK1pvF0ihUxdtcgNcn7Kad68h/4dhLmDthtaW8P2KbJeCJzoYyAvmkWmjUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954409;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4s3mRwUX6ILMJnNwIdnhxtjyTyFSrX3O/LnhuPICPo8=;
	b=duB30OjKznI9Lt/NnxaoQJVyXvBaNSiIAvehd4SU8vvIoLU1fwzXGmVvgpA4KkpSjIND
	 tOUJjA/Sle8rB5XVMSHo+Wyn3a27Dq9ziStupy/M5IkScGqtATRv2rlXVCSL9zdhf1sRF
	 Q5MATH1TYpOAajcGQ0lu98CzD5BhXfFWC5zRUAUCaL1sczqRwCkxOdPSBtg/mXD2WGKrZ
	 NqCLroCcGpAHAhWjDTDxO+2+rY0KIeIZmsqPgTLZv9wWxBoUYw5CcyKmoMAVrwbZeO1Fn
	 V4xCKDrHuQPFTl10LyhhFMZqNeKp4Eb1nDt8SLXkgRjD1lD65arHnHCD0Wm28X6nUVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbPCRoQE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E728F606A31C;
	Tue, 17 Nov 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nbPCRoQE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC151F000C4;
	Tue, 17 Nov 2026 22:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954408;
	bh=4s3mRwUX6ILMJnNwIdnhxtjyTyFSrX3O/LnhuPICPo8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nbPCRoQE3o89KlLREqLTWYyUtsNPEovbGEBCvg9Bs5W+CQn+EDoSd4kW6CqQ6noPn
	 fij8XDQ78Aiz1EQNF/Hnm/KK6k1ivKx51Rs40LhTRyKdis/NA0QALWgxa1jEn7XRrO
	 WqI2TGo5r17KymhUe132c+/rkmGIwK7In96jrBpnei3XIdW2MCH3wwmhw63UR7WLv2
	 yVsOlDs+YPNQvWkY+UMnWYyMYjKrrDoAr11HslTU11tjeKxn6U3EieqogoqSJvWMXD
	 N84lCTVVRl/84g9ywTc6nzbFoO5ebOnayr+Ug7EKMg8ituJcg7A6tTW+g5Zi7FTqZK
	 GrJXO1eClwF3Q==
Message-ID: <44bb9bd5-42f5-46d2-8dca-dd220aa221cb@kernel.org>
Date: Tue, 17 Nov 2026 23:26:38 +0100
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
Subject: Re: [PATCH v7 3/6] soc: fsl: guts: add the RCW override of the pad
 muxes
To: Vladimir Oltean <vladimir.oltean@nxp.com>, vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-0-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
 <20261117-for-upstream-lx2160a-rcw-pinmux-v1-v7-3-5d7201970629@free.fr>
 <avzCrmvlOQh0RVjT@lxl00025.wbi.nxp.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <avzCrmvlOQh0RVjT@lxl00025.wbi.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/11/2026 à 22:10, Vladimir Oltean a écrit :
> On Tue, Nov 17, 2026 at 03:53:13PM +0100, Vincent Jardin via B4 Relay wrote:
>> From: Vincent Jardin <vjardin@free.fr>
>>
>> fsl_guts_rcw_rmw() only serves the SerDes lane modes. Export it for
>> the pad-mux fields of the RCW, and for them only:
>>   - fsl_guts_pmux_read() reads the pad-mux fields of a status register
>>   - fsl_guts_pmux_override() changes pad-mux fields of one under
>>     rcwcr_lock and waits for the status register to follow
>>   - fsl_guts_pmux_override_supported() tells whether the SoC has pad-mux
>>     fields and whether the DCSR view of DCFG, which holds the override
>>     registers, is mapped
>>
>> Each SoC lists in its fsl_soc_data the fields that can be overridden,
>> per RCWSR: a register or a field outside of this list is refused, so
>> the SerDes protocols stay with fsl_guts_lane_set_mode(). The LX2160A
>> lists the pad muxes of RCWSR12 to RCWSR14 and of RCWSR27.
>>
>> Suggested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
>> Acked-by: Frank Li <Frank.li@nxp.com>
>> Signed-off-by: Vincent Jardin <vjardin@free.fr>
>> ---
> 
> Looks good, thanks.
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>


