Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317322;
	b=iSypuaSCrLC2V9X2UCkp0QCVqcJY1crPvuwcXqVnfkMCcIXQd+3SdrKyF8D4GFxtv8ce
	 MJhskmxBH1TyrfzlcL9KkWHGdFhNtVTDet6Kgn9dnUsho4GBbhYKNXciMQJ8vmv7lOypO
	 rQDd0MtA0aj98DkGKFD1GaLsTpmfc7tYb9Cu3bDBqIYdX67tpVuHIaGhbCbnmwO5/BX/X
	 F2e8lIZRTxIlrSPdADJpHMh8p9TBN43wFfZx93S0quhRNpI+tSlcsDJIlXTER4SXpjyH3
	 coeK9YGbGI/MaQW7LrUjL6YAgCOzU4fT4783VKPl7t9QPbGgpnFiknNgkwPowmFkFoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317322;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9eKl7b8wHlyQNjxuLHQg1pgl93UvcYeRIZp5vfnXBA4=;
	b=mh2ttkZK23eO+gTpmpakmpmiOqU55K2G7vAlIPOlW214QEtSdEDb9DuQ2wyf0KUrl2qv
	 KvhcO7wH2j/8ctUPkl8uxpqZEWDLVmw7kCIDDzdK3Z5idAHRTS67oNt/LaEpXmEQ4ExMM
	 wBzj/33gPSok2HsEwDjhyHeYeINm9lvBaHf10h0kajjkit6Vl+bPmImAPvD/qqiWoNVJB
	 Feu+Qv97HsHaW5eEFCD2Uri9C37jL+iJUCH9W+C8P0BBO3oKYT+K3eYnLAxCA/B9k9bc7
	 bqEsLEww33LIovOH2mA5TdQFgBBtpEnYaEejOzbpuvmF36jmt6aE1TuaYkOy6as6MWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhVbHuz5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1760798B1;
	Tue, 10 Nov 2026 13:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DhVbHuz5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4F61F008A3;
	Tue, 10 Nov 2026 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317321;
	bh=9eKl7b8wHlyQNjxuLHQg1pgl93UvcYeRIZp5vfnXBA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DhVbHuz5pM73OJkt8de/TR7VboJXCLI3GHavDoVbf6/c+CUMVET06DBtqOBFRDZpB
	 Sj0fz1g3JdaApgrdj5eLrxj1PL0TF+BchBmufMWx0kgbv0AYTd8z3Qs5kVHZjuY6G7
	 DQGF8O26yPMZIewQF3Rovi2oUIFEXBjmt6gtaghphzYAuhSkqkqE8XyA0KQs784Bl3
	 v/edUA5grLLJvrvQLLVLOL/9UhQxg/0Yrpuu/vD9JxmtMXqLJ1bssQvFLRU+pzRlEl
	 B4uQL+KvACXup14SKlPR2wWN2ArP6uYnvN62nJav8KBAdHZD3sQeD1IEXp4Pmlljrk
	 QbbVLRaWg/S6w==
Date: Tue, 10 Nov 2026 14:28:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prasad Sodagudi <quic_psodagud@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned
 for ownership update
Message-ID: <20261110-modest-significant-ostrich-8dd408@quoll>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>

On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
> be owned by remote island io independently of the selected mux function
> even if function is non-egpio.
> 
> Presently egpio is treated as a mux function level decision where as
> hardware programming guide(hpg) specifies it as pin conf level decision
> i.e setting egpio bit is independent of selected mux function, the
> driver/apps claims the ownership of the pin if it's egpio capable in
> case of mux function being specified as anything other than egpio.

I don't understand this. If the pin is not owned by Linux, then simply
do not list it. What is the point of listing a pin configuration which
should be skipped?

Best regards,
Krzysztof

