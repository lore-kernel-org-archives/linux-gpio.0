Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752339;
	b=KmqZc8bvJWkaHAigcSe9SCzU0TBagbr8PtnhRNYieamhK7C/LqEU/R7DYxN0TJuDyZ4O
	 6jL1aiXtVUS5wtDv6260pMoIzAs4LYDS0vWE9yG4D4+CTZn7SvMBdvu2EccqTX9djvoE5
	 kKe76X9ouvDZE9MCwAe8PYKKO353lFc04Hg3Qmn16YoG4LZ4c2CfBt5+slnGzofz8PzK0
	 AODmTmjiJ/UMGh8+U3UYbHbJSbCszUTZTFh/dVqj0VcGOUYhJMstRGRGy3DsPKcx1Tzi8
	 VXQky8lIb3k6dUlgUDcz/77vws3VBsUXVKgdoXdkaYpg1SgKzVBQRQX+1jH/DAR5SJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752339;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=b61N7diDmGazKFB3UaE43uvQV68VXVLWOmtAASrPvHY=;
	b=prK+f7NXqCWWR7Tau1zWa274sW8gkGIWUafjSyYX+5u8hxfwNEgKCi1sDBzqLJmWN8xP
	 W/cQiG0fhYTGzxYezqFZsh2HGfxRc+XERo1AcGw24/rbX0i3F1YbgrZEiywUFiz8O/cu3
	 /+bWM6mfFmwhKZGaR0TgOEOWHrYtWgNFau07vVuCZPDNP2Y4/hB83ePkrPJWgy2RWcYCT
	 ZKXffJeNGEIfs7v4JlmNUJ1w+uTz6osu/ZzwrJhCht8BT/5Cu5EZ393gnhZriaaV3aMdx
	 TgUkkIk2ZZqcjhl9wg96QKu2c+727dbMknPc+BN22RfiHpmhY1QoeV+KJlMn4U+Rchw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DKYsAIPw;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CCB606A31E
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5CCB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DKYsAIPw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b61N
	7diDmGazKFB3UaE43uvQV68VXVLWOmtAASrPvHY=; b=DKYsAIPwqA/Di1b5Tizp
	TFFcsd0MEIIhMyZr0NIH3Q90HchcsSsQQGvYsiBju8er5/1V0o0IgH7QlBzvAfNh
	/gJpzq+dDtTIwt9SDYaMt2qzEroeMJ3jARFue9aBvkEmSBdq2O3kh0cXk2CEWp8o
	YKsmxjWdEZJ54jJPEAk9i0Mu0lgcM0nF42YYqZZMERfbYlHqZgDspMBzUGT2r1Uj
	K/Fywzg4rJG87KGnKUUxQs6jRMDrsOhZWuLtle9FsTuavNAdNor13bA4tNjnuM5s
	wMxkgq9PwJOCnc2n16/HB7SA3dDeu5emL2Kp7uHFv/+yb6/u2adLQtGehuFjZnhH
	1g==
Received: (qmail 1517709 invoked from network); 23 Oct 2026 12:45:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 12:45:35 +0200
X-UD-Smtp-Session: l3s3148p1@cpAfrn9eFpoujnv2
Date: Fri, 23 Oct 2026 12:45:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Diogo Ivo <diogo.ivo.sx@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
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
Subject: Re: [PATCH 4/8] i3c: renesas: Add RZ/G3L support
Message-ID: <ats6zi2lZW09Bs2e@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-4-30a47f25e515@renesas.com>
 <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>
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
In-Reply-To: <20261023-thundering-axolotl-of-examination-aaa6ba@quoll>

On Fri, Oct 23, 2026 at 10:28:16AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 20, 2026 at 10:14:58AM +0100, Diogo Ivo wrote:
> > Add support for the I3C Bus Interface on the Renesas RZ/G3L (R9A08G046)
> > SoC by adding the renesas,r9a08g046-i3c compatible to the OF match
> > table.
> > 
> > The controller is very similar to the IP on the RZ/G3S. However, for
> > instance the RZ/G3L variant has no HDR Exit Pattern detection interrupt:
> > RZ/G3S exposes 17 interrupts, while RZ/G3L exposes 16. A RZ/G3L node
> > therefore cannot be described with the RZ/G3S compatible, as its bindings
> > require at least 17 interrupts. The same point applies to RZ/G3E, that
> > requires 3 clocks while the RZ/G3L requires 2.
> > 
> > From the driver point of view there is no difference between the two
> > SoCs: the driver only consumes the tclk clock, the presetn and tresetn
> > resets and seven named interrupts (resp, rx, tx, st, sp, tend, nack),
> > all of which are among the 16 shared ones. No driver changes are needed
> > besides the new compatible.
> > 
> > Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
> > ---
> >  drivers/i3c/master/renesas-i3c.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 4fddc1b4fdbb..80a6df1151bf 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -1625,6 +1625,7 @@ static const struct dev_pm_ops renesas_i3c_pm_ops = {
> >  
> >  static const struct of_device_id renesas_i3c_of_ids[] = {
> >  	{ .compatible = "renesas,r9a08g045-i3c" },
> > +	{ .compatible = "renesas,r9a08g046-i3c" },
> 
> So fully compatible? If so, drop this and express compatibility in the
> bindings.

Well, this SoC has 16 irqs / 2 clocks. The other variants have 16 / 3
and 17 / 2. So, to which one should it be compatible? I'd think 17 / 2
is the easier one.

Or should we even refactor r9a08g047-i3c to be compatible with
r9a08g045-i3c ? We currently don't use the third clock as well. That
would mean deprecation of the old plain 'r9a08g047-i3c' binding, of
course.

Opinions?

(And yes, hooray to having all permutations per SoC. Waiting for the
next one to have 17 / 3 :/ )

