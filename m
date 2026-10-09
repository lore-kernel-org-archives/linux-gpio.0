Received: from sender-op-o16.zoho.eu (sender-op-o16.zoho.eu [136.143.169.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE85695;
	Fri,  9 Oct 2026 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579656; cv=pass; b=dwUapIiGnXsDzI5zRl1loMd88xf8LwKG45IJjqKyF4WDcsPNsilolbtsDatoSsQAn5JbvcpLeXBM7Blw5pYJXB5mbbGXCoN8i58g+jlKVdNY1cGnkE1gwpB1YHBMlItq/RKKbfMDMufdFycHLfd+gLOoGrHg8KHsHG1q2S4XGDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579656; c=relaxed/simple;
	bh=THHPlO4JC0tD1q2XvL2U8lkPubxMa3QgqvsQ1Oyx/PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cqnd/7MvZRNAl4ypUjNcrFCvA6GjKs+uNg1rmT//qxPJXZWn63mv4nMKc3rXRcszkLPSN+Bw/XcJk5z0dZt/+efv1YkX1q05GOVF0tNGENXTIu4zQoV/FW6rHK2isBVZobDKURmoHruj6eKdXU1lj+wDn9sfUper/VpX/Yy7p7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=dwF5+Bw5; arc=pass smtp.client-ip=136.143.169.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="dwF5+Bw5"
ARC-Seal: i=1; a=rsa-sha256; t=1791579632; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ksf6vDbJanbUo8MV9/Kflb+kRZK0McKKlQ3ekDEJA5lGSqN86UEdjMSYeWR/7basWGl1g5VllMTenATsLwgB6ExIML0NLpkaQVIiMx1DanLLthK7xNZaitNq6usE2J6fggvTWdyb9JyTLhugpDqRNTzIpqP+CYCul3PZkbdAcV8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791579632; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=THHPlO4JC0tD1q2XvL2U8lkPubxMa3QgqvsQ1Oyx/PE=; 
	b=dyrsQNiFmdEpkAdEMyc3sM4ythwbXCJ+PgsKeDP5QJ4VHnQhIcZMB3oSnGLRK+r4x+AYIDITFu/ntc34fiSwMoiLSf9InIfV5ezmpAOVkZ4TQHiegt+bpHKZ718znXGGHAW+Qr0DBq2htAQaf2ZnlQd3L+lnuGBMGs/P1ndGwS4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791579632;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=THHPlO4JC0tD1q2XvL2U8lkPubxMa3QgqvsQ1Oyx/PE=;
	b=dwF5+Bw5orUlO2EFFBkqgxUyCPAsSK4BDAjNgDg0c4wcEHuHWszUIJK7twx8odsL
	oI9XEciz8hE12Of+sMxsO1DltYddRDzmJFOYQK+dhEc6sZE9KCWaIGEIfsnrJ5SRjwN
	d3Lgz4j/MMo0AMsyzcr4I+IfIbpDd7h0qGIYaiNM=
Received: by smtp.zoho.eu with SMTPS id 1791579629038635.377955910694;
	Fri, 9 Oct 2026 23:00:29 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: sashiko-reviews@lists.linux.dev
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject:
 Re: [PATCH 2/2] arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64
Date: Sat, 10 Oct 2026 00:00:11 +0300
Message-ID: <179157961155.2005704.11909242880150287048@iav.lv>
In-Reply-To: <sashiko-outbox-166062@kernel.org>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
 <20261009-helios64-pca9655-v1-2-673ee4432650@iav.lv>
 <sashiko-outbox-166062@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Right, 2/2 depends on 1/2, which documents the pair; with both applied
dt-validate on the built DTB is clean. So 2/2 should go in after 1/2.

Igor
