Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751280;
	b=OAnVz29FupnTPBGXol3k8oXPyVWvoAr+FU3l7LWh9UyU30AT1l8FqbKSdYU+iDaAHnTA
	 prswO5A3qwP4sXpNyG93sjWjRvySq6JgreOW1HHezP3+bF5t+n7aqLb4v1Qq/sfM3moFs
	 yuTp2uCVgNbHJh5uiG0tQ1X322+g7gbYGRs7fTPn97efz5idFy1+DwXEHzswxcm9+6xV/
	 T6XTs3aS18VJKdM+RYxUckNdrqpWjUqdvqG8yf1qyvt08Qh8oZuiPfhxe0VeQ8TnHTFYB
	 CZI9QiQXEHEhkUi9EKbgr8nSRSJhL7mAWJw5rfQscNpqj9pYBJBylL1ELSt8DPDpIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751280;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=35J45cG94OOD62+cdK1/ryqr1JaqXdQG3Tn3ixfFouQ=;
	b=TqYr2a2EGYWFh7EZDBUwl/iJ22oSQOGpgxqjhWEAJEhBsWgTwHTjAkwhppZ3WxqW156M
	 kKMaPG/IBr3fzyi5RoLjy+n+Do0fXAsEqwUzoKgmjUKHFhCjXpr9p25FkFSr6LPRDLsAS
	 PWiRT8JPJXwnM7UN9RyPRwWpjP/el3tob6t9ciSvcCkwMaHYDDS8DiHgRjrVQYGMOFLl6
	 UHQ9HUnnAf1wreMq/BBms1wTjdi68G/tPAT39ALefUjRH8uKIYxnHHrosPMtg6DHGiE3f
	 Ya1Z0Anl6K/HVey3Shrpc5cJU1WCLEBjnxhyXIvYhijVd+b2MWRC1HWfCqoqnZLmzYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=il56kfT7;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBACB606A32E
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBACB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=il56kfT7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=35J4
	5cG94OOD62+cdK1/ryqr1JaqXdQG3Tn3ixfFouQ=; b=il56kfT7Z7Dm3ew7sjn1
	h+k3m7Bvl5HLq/Qj1yHbnt4E5ALQYYVxdBFRohyxRS9meJTAUc/ldl+VE/TINNZ/
	D8pcvxN8RDdDVyL/uxbvPUvU0BJ5H16PXwPxHl5+YmZWLJVqc7la9aNGCb7pVxav
	mHThwnPAw/YMu9Ac36wfk0xlKZLpMxFsbne5VB228SLG4MaiXe3VJe2IaRbnEm3b
	yXVsDfbb/KDSKLd4GO/Rp9/VvzXPllWsUWn33gSdgPZLEgx+4NyeSfxy/HcZCV7x
	+jNzOPSplrNT5oX2lO3SiukLs8559RXedErqHiQ4VQevSFdRn9PJCYKLbMUoVy/C
	vg==
Received: (qmail 1512198 invoked from network); 23 Oct 2026 12:27:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 12:27:56 +0200
X-UD-Smtp-Session: l3s3148p1@Rbb2bn9ewNgujnv2
Date: Fri, 23 Oct 2026 12:27:55 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/8] i3c: renesas: Drop comma after OF match table
 sentinel
Message-ID: <ats2qwNekJgw5nbi@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>
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
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-2-30a47f25e515@renesas.com>

On Tue, Oct 20, 2026 at 10:14:56AM +0100, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

