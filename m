Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5863164D6;
	Sun,  5 Apr 2026 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775374787; cv=none; b=c491Vbvxx51CuwO4XpVFSXxVfZJpGFmfB1S/qe1Gc2MzliT4mdTnCJBCuTn7iquTUCKO1AheSmHl6wIZ2XflwLhryTUmtSkPlzySmTFEVPy7FyAyTtfL/ozXQ8rGo8RPffoBwLepyLKeowNGXEPnN0wOSyDzl6SM0EQ7MkMTco4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775374787; c=relaxed/simple;
	bh=KL1POaGW8c71Y8RrZfEWpQeJYdDRScZzu3DmI05OfMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr/P4TmjbEGCEI2w44/Q/xEqDEVvbyg7ak0y+zny5iR5zRc/xCErHy6dsdfSzrra1m6+VMqrfU3zeST46hqem1CRYG5QrqKHGZsEvEtRuCtCF/ehwbgL0//MFgoRLw/oqPlv/+TfNpoJlKjM1vm5Ry7hooKP3P5OjqAzQ6BIBHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmIsX+V9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmIsX+V9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CA5C116C6;
	Sun,  5 Apr 2026 07:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775374787;
	bh=KL1POaGW8c71Y8RrZfEWpQeJYdDRScZzu3DmI05OfMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmIsX+V9QJHtVqJGVXzEFSCbKqdrXi3DZCjsIx4ILCxJLO9K0E7CxqkZ2cHkOTu7Q
	 eVmOHbLYvJVbHSG+NEnXTaKHf7e8PJTkifmmjTJWTnTC68LLLPbBIVLBM2Gbu0T8oL
	 2ras1P2Rcx4tEwZWsVL1YE5fEPPehwG20SJttB77V1kE+Sob1Hg7URTT2sM35IeI6r
	 2z8FCDhleWEZkIWiLCWJqCwDWQ1+a9395PZodFuD4BTOf3/IrQUdDhtkloDCcjmmBM
	 KAL4Qcuj2roZi1LMNTeD/u4pi5GS7Z8B6o0usL5qfHU0ePJfVBKCsQfbnPoKesP1dy
	 g0Io0Zr/8sQjA==
Date: Sun, 5 Apr 2026 09:39:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: defconfig: enable the Qualcomm Nord TLMM
 driver
Message-ID: <20260405-hallowed-antelope-of-lightning-23f25e@quoll>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>

On Fri, Apr 03, 2026 at 03:27:57PM +0200, Bartosz Golaszewski wrote:
> This is required to boot linux on the Nord platforms from Qualcomm.

Which upstream board uses it? Can be board which you are currently
upstreaming (posted DTS).

Otherwise I do not see point why upstream would care about defconfig for
non-upstream DTS.

Best regards,
Krzysztof

