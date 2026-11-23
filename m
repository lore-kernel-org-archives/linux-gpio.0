Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449050;
	b=RwEWQ1wF+TnSHjnrzo+5Y4VsL2SCKgadOe3zSvk+sBF1RiI6z4/e7CR4lrGT/64qwSAo
	 KD5+VGxpFr1xVpAaVNNvA2Yj/ruVZGS+MLh3CJYzddNIXNq8snbL4CkEijPevfi6AGa5u
	 14y+6rzg5EMyvmFR6kpgiKuz0RctIQwB1No9gPuxEQMgRdk8VIjJX8X0a6fox6vqjrfrW
	 1OauB27MUHlD+e98VzaQgrR8AwJru9lWu4WdUMICktTZFrCq5tnFQLZ6RsgzKTGOghSml
	 OW+MrXX0YF3bnBk55HUGpHHEpnMMO76QQag5O/6S3ITFjMLLDpS4nbqHy1O3M7Z4B4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Zh1LpqpoEQL55/9hCo2OIeZt78jLD2hdhPiUuQeEPBY=;
	b=CwflhWe2Rqi/PRyrQIFQJv5+xSK5I+cHdBT3qJs9XAW/wrNZrG6nef5/q+DvrogfeuJ7
	 rPrVpgwwzlxxLQtVDVyqsWU5oDsvM7SUF6YOiilLswcPJwuMkqGZAvfwYpAvEAvj3CJFy
	 hqknuFdAwA0W1r20SJGKUu4jS62YHI4puDNV57R/B0eV6wmjYqtGUUqdj/TQ9+KBIhT4p
	 ge+pvWLymgqtbozA7SBzebxKXISPcCcV25YSsDeMwKEtbVTEHPjkI37Me3zKg2DwsrIS5
	 cK+31hXFqpe+a3mJ+5tJkYPJMtzDqw2fe3/j4bZKsmnVhClOanJraXyf9jXe1Xx8VjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ku3FGPAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9E169606A31A;
	Mon, 23 Nov 2026 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ku3FGPAQ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 074461F000C6;
	Mon, 23 Nov 2026 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449049;
	bh=Zh1LpqpoEQL55/9hCo2OIeZt78jLD2hdhPiUuQeEPBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ku3FGPAQFrmg1+IR4bIW1nE37IeF+1D1+wcBjvfVbVpEFCrxsFND4u8RZfLr+XHNn
	 8C9AeAHKBHqFnNJ2G0TI8y5riqrFhRkXFkUK6QSdjj1NG8PIz6f6C3qTBO7iwVaZRr
	 jmqt73ycxSEfcbbV9iBStiNV91y+s33G3w6vs64HtlsATZIIWopAvQTeK3EbqwH1XY
	 WdN6xLkntWoQh5WJfMbJZVEzzYSA7V/Zvr+h3TxofMzL4dAF+Me/77r6nar7i54GGh
	 DvFcgHrmcGZWqNH5i71dy1emnNk1zj2aJyz51OQV2x0fWfKpUtby3b7sJsDXtGNWe8
	 LxLR+DZpE1wWQ==
Date: Mon, 23 Nov 2026 16:50:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Molokai TLMM driver
Message-ID: <42mjzxbdxdlnfvd77cvfd5rmxjbhyftkefpzdyo5qk7ykoyk3k@op3zmzxvddrv>
References: <20261120-molokai-tlmm-v3-0-e5fc37e37011@yahoo.com>
 <20261120-molokai-tlmm-v3-2-e5fc37e37011@yahoo.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-molokai-tlmm-v3-2-e5fc37e37011@yahoo.com>

On Fri, Nov 20, 2026 at 09:22:29PM +0530, Venkat Yadlapati wrote:
> Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> (SM8845) SoC.
> 
> The register layout is the one of Kaanapali, but the pin functions and
> the GPIO to PDC wakeup interrupt map are different on every pin, so the

I checked the docs and 35 pins have the same mux as Kaanapali, so this
overstates it but whatever.

I'll queue it for v7.5.

Bart
