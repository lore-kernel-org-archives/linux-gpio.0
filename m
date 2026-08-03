Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743D2D23A6;
	Mon,  3 Aug 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766389; cv=none; b=NVtRJI3p6WX5UuVjbmuVQwdzoHsadsmKimV0Bey3E5Nq51Yvj2Iqgi5bsoLAnIzELUfeyZj1zoy83boZLBAbzoGYc5oJIzzZkUIEi1FO8XZTo0Qktrc+9oznR4+GItzyGnVHlHXMU4avz8vxSVzN80wv39jUlXkB2i2CEdQ5dJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766389; c=relaxed/simple;
	bh=YMNvusX9LkKSyLKyFVXEOeMchH7Hgn44IJ52cwQeKJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GufN4K0/3XMiSqxSjLectzg2kZWwpGCyMOPKUzprR7ThQrKsGVmmOyhWZSG1JfqERhpXLCYPqISRsWgM4ibPZNjbAd6545kHmJpsE+Eio2FTfExdAR7ELcZjLzpJ9HczMqKNjV5hiklxPxYm6Z2fF3u6h4mprj+t7VL58/rThrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNVNklkB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNVNklkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3744E1F000E9;
	Mon,  3 Aug 2026 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766388;
	bh=ZvuX3gYi0iFYh3K/3zoFONlt8miaxRz0FW6PbvfW+CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HNVNklkBqBtRhyKSY3TW0c2Sapiig58cPzEbfBnhyKxG4P10SiQaKB6BBl6NAoxNQ
	 4Z5dcmbqPljiloJsSoFCXTEqkqmt42ziFjCX92AlLpD/cwQCIjDLrwyCfB8/ci3mEY
	 dV3uDK1opzozzNEO978RkJ+pk2z+h5+U79HnrShlRxrZrxBC1HhQULxMSXrMHXXy7F
	 UuRuy5E73wa+7gU1n0ppdCIRb6kiCe5WSNLwnn4RBbuvRtXYP1/F0LgJ1GAz2cS/S5
	 77HLDo+sQTXpHug6B1+boWye8T5KubiEaQVPN2UkiW+efTOmTVG7s7WixwPNbA+1C4
	 OuL8NT6PEeiIg==
Date: Mon, 3 Aug 2026 09:13:07 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 01/21] dt-bindings: pincfg-node: Add property
 'input-debounce-ns'
Message-ID: <20260803141307.GA3243695-robh@kernel.org>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801072711.153217-2-changhuang.liang@starfivetech.com>

On Sat, Aug 01, 2026 at 12:26:51AM -0700, Changhuang Liang wrote:
> Add the property 'input-debounce-ns' to specify debounce time in
> nanoseconds as an alternative to the existing 'input-debounce' which
> uses microseconds. Make the new property unavailable when the existing
> property 'input-debounce' is selected to prevent conflicting definitions.

Why do we need this? Why is usec resolution not good enough?

That's what your commit msg should answer, not explain the diff which I 
can read myself.

Rob
