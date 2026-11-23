Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449194;
	b=ct2u/K4V5HQif6PdguUz87GNBIoguS8doXEDAujbbZmU9pNt12/hdPtuMeFj4ubWsMUF
	 TzA0ysHR9i7nVppIRnu6zPafEWO0G1jp1X7GkU5RsQkLKqj0KlyiFolaUD/xrs4EiJ143
	 Zb2j5qJzqvcWhiRgZtOOFRB9rFpO8N8zDcs+5MlEZYd95SR3YnNrp0XZeuSMVQEJPIM/t
	 zQ1LlEkmzB1bpeYRP5dBJ8KrPiO3q5X+TvzetPQCHROgiAKSGvNYFnaYGIqybO219QGIo
	 oVxkqxlOlH6SORdEqclqf74h6BXcUI+nrLnysBvwVzawc9fu7GqZsa9tDrCx8jzNguw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449194;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jq/ylm+m1piYXZ0HVA/JhDeoACP76aCcFO78z/oXhFI=;
	b=WzZgRfgWkZzJ4Z0Ab2LKDLfagbddc5nnXr0nAbWoTDZJA26Mn1reiPdaGBBnvpH5H7+v
	 0zz5F8e3WH6BePJ+CTHFIM/knBLWKIpMEOnNYaZmC9LMI8MJkEq5HYwkM95IRDsV+j+QD
	 WCnYcq785G2POFTpPYyL5w2fXkF4L0xf8RjYcQ3U6kj+I9mW15TDM7oRamLM1PWa8e65p
	 mVJ72qGBisn7Le4TZKrD/6e4mAWYvzJgUClfAVZIsgYANvAX8EYx3xYywxgDSGos7ScCT
	 3qqW79/Wg5ANXz/l9H8bopi4a8bCcXW5eEQayg5aVZOevTPA2x6Zw7aoV2AXw7A7LXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PXSy2Z/6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 31DDA606A32A;
	Mon, 23 Nov 2026 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PXSy2Z/6
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 19F401F000ED;
	Mon, 23 Nov 2026 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449194;
	bh=jq/ylm+m1piYXZ0HVA/JhDeoACP76aCcFO78z/oXhFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PXSy2Z/6fmnWIt6pZ7TKDiSVKmu7QGwa3U35e8uYX87MDsgsOSFJGH7ad78/srz7x
	 DMIcaYu4lP4/lmSwox6iVPvPQR2NIwRPjs2BOmX/wpjHXqCkeSMnXj8L+DOamc9JLw
	 av4sQK/KJMq8NVZ72b87bJKLPapZdiNDtDeJ+gRR8OhLYFCJvAYObx09Z5UJkJyENu
	 1Cnb53RBzvHSMZRpsFZNJ57isMa0aSt/yqBtRLScQajx16XrK72rn9mRirDJFCFZ4e
	 +m2yJQ/NiY01tdKi31M5rGwiTdWtotvYAgRgNZCpGFZ2f6OsoENCgBs/jXcZINyNZt
	 LyA2a/KOEIfHg==
Date: Mon, 23 Nov 2026 16:53:10 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Molokai TLMM driver
Message-ID: <pqqpa2z6kisgorrjbj24sovzugxcgub7wfayc6mqjtnsf3nwa7@mg7s6pgfu7ya>
References: <20261120-molokai-tlmm-v3-0-e5fc37e37011@yahoo.com>
 <20261120-molokai-tlmm-v3-2-e5fc37e37011@yahoo.com>
 <42mjzxbdxdlnfvd77cvfd5rmxjbhyftkefpzdyo5qk7ykoyk3k@op3zmzxvddrv>
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
In-Reply-To: <42mjzxbdxdlnfvd77cvfd5rmxjbhyftkefpzdyo5qk7ykoyk3k@op3zmzxvddrv>

On Mon, Nov 23, 2026 at 04:50:51PM +0100, Bartosz Golaszewski wrote:
> On Fri, Nov 20, 2026 at 09:22:29PM +0530, Venkat Yadlapati wrote:
> > Add the pin controller driver for the TLMM block of the Qualcomm Molokai
> > (SM8845) SoC.
> > 
> > The register layout is the one of Kaanapali, but the pin functions and
> > the GPIO to PDC wakeup interrupt map are different on every pin, so the
> 
> I'll queue it for v7.5.
>

Actually, you rebased it on top of Linus' devel branch. Please use one
of the recent linux-next tags for base commit instead.

Bart
