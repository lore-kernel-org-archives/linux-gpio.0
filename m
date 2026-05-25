Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522DB290DBB;
	Mon, 25 May 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736423; cv=none; b=qQGDvluakxJ4cmfT7Pm5Tk2BMfRb1Q4/UTe//sIJietTV7vjOWrT3xj8Gzbg6dQc7R83vaULVHLyX4fSX8wwycY2AVsg+zDAfoKlRFDcd29fk/twEbAwsbQyrQU5TBXdnPB1XQBf4qQLVLUILH+Rpb647nSpiHWmj0UWINUp0bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736423; c=relaxed/simple;
	bh=Nb//zmvaiULAOj+JTmDD3mOwurSeBpbF7LlUDMDxTvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/GgMtp3YaeyLr+krUCBweOpiOWVX2ieDdf0FUN/OMDuHVREd1SVAqdCuZ7dNSEPq4OQU6t8AqxJT7TmbGnuyI5igOIpaYuqUu/yZo1feWK36+RqBAGIm4gLZ0w7jAtLjEoSDBrmOk+eErEr4qTWzdcN6AEnSb465rf0kH1cYZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RC3leRm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RC3leRm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84481F000E9;
	Mon, 25 May 2026 19:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779736422;
	bh=HLZq2vt2meYiHOLEktlUSaZkqA50JlxcEcB4xiULLZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RC3leRm2W0E9mLmKcdKEhffmzz97Kf/VGwIKmLVBiFWtT8wNql61jzjkNintnZTPj
	 Y7LmkxQLNo21PQkU/h91hjEWSBk+2DOOnjoL4M/vzr28wMXp2PvqqCTVQuIZAMqEyO
	 UZQD9tn+c5A/0vtGYyB1H6xc+4pcFKMsc8AtdeWQ=
Date: Mon, 25 May 2026 21:12:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= 2/2] staging:
 i3c: add Realtek RTS490x I3C HUB driver
Message-ID: <2026052533-flattop-carat-c489@gregkh>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <20260430121354.6253-2-zain_zhou@realsil.com.cn>
 <2026050412-bush-rosy-959d@gregkh>
 <1a79b9c3c6c64e5ba65292efa2f0472f@realsil.com.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a79b9c3c6c64e5ba65292efa2f0472f@realsil.com.cn>

On Mon, May 25, 2026 at 12:58:33PM +0000, 周寅 wrote:
> Thank you for the review.
> 
> We noticed that the NXP P3H2x4x series (v10) introduces a generic
> I3C hub framework. Would you recommend waiting for that to land
> before resubmitting to the proper location?

I have no context, and do not know, why not ask the i3c maintainer?

greg k-h
