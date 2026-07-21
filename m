Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0C72AE7A;
	Tue, 21 Jul 2026 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637929; cv=none; b=KSVAQe5df1HSa2lAcVMcTX6ruS+zsY1LUrsfs7N+tpl5ggo4ro68V9Ou5Eg91N1UKEMaKqG7FhiIOUPjwrAWjstI11LOTXqP8ouY+fsRl2zYERXDd8hUzpMRZJNdGRYdc7xcy+t/V6JLmrxW0rrdZytf8SImRymsITb0TooSOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637929; c=relaxed/simple;
	bh=sYGTdCtHue4hVyyVo0086JB/pB8jOKzdgc8M2ZiBRt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IY4bx0NwE98s90M5MdKanO1uCq7XLzQNwqwibsatNNs7/6bKEU+ePI+AH/qc19sIkKBJ6NgKDFBpXuS6yLVFE37g+FUdS67UzeiKEvI+iiGw1TpJVvN4X59ydZlHh98FTkNjGAYnvHcxM/Zov0zlktRK1jXzWRaHqCC4W5g6QSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UfyeBY73; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UfyeBY73"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=py+kVer8y1a6uREwhTLMnOPCYBBt4/ypQx/1Dyh8NlE=; b=UfyeBY73vzy27dJizTWAlgzPRe
	H76y57MW8rPT1PXVIHVsVh2LiNjbOSl4Tnh+TOkxX0IJvCFkmfuWhzNQ4oBRWVYLKGwRDi73fLIwk
	hNOm10pnsbKCwhYYw8kSjJg/4vjzgBRRfimQUp+RHZTaBI/5DjBce9eK4DN+XwUvNd3oF71UBYBO3
	a/b1USPQb7VUe6UKvx7db/8IvQhZwvqietnBfjgnOV7Eq8hZxZUdM58dvPTXptQr/G0FakLIc9KBe
	KZh+7IRIof2CmikmMqdt/1h3C+8/A6tmEIbtyV382lMlJvlb2pKu/l8q0GeoRwYFoYtp8FpCABulP
	3QBMho9w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 1/3] dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf
 property
Date: Tue, 21 Jul 2026 14:45:16 +0200
Message-ID: <3352010.NnENhoQgcM@diego>
In-Reply-To: <20260721-ambrosial-raccoon-of-glee-6219dd@quoll>
References:
 <20260714192535.2082729-1-sjg@chromium.org>
 <20260714132531.v2.1.d04a89a3849323a0dcee2c701cba43adbb0523b2@changeid>
 <20260721-ambrosial-raccoon-of-glee-6219dd@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 21. Juli 2026, 10:13:38 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Krzysztof Kozlowski:
> On Tue, Jul 14, 2026 at 01:25:29PM -0600, Simon Glass wrote:
> > Some Rockchip SoCs, such as the RV1106, give each GPIO bank its own
> > IO control (IOC) register block rather than grouping the registers of
> > all banks into a shared GRF region. Add an optional rockchip,grf
> > property to the gpio-bank binding so that each bank node can reference
> > the syscon for its own IOC block.
> >=20
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >=20
> > Changes in v2:
> > - Add new patch for the per-bank IOC reference
> >=20
> >  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.=
yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > index bdd83f42615c..774e9c7de606 100644
> > --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> > @@ -44,6 +44,13 @@ properties:
> >    power-domains:
> >      maxItems: 1
> > =20
> > +  rockchip,grf:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      The phandle of the syscon node managing the IO control registers
> > +      of this bank, on SoCs such as the RV1106 where each GPIO bank has
> > +      its own IOC block.
>=20
> I do not see usage of it in patchset linked in cover letter with DTS.
>=20
> I have doubts that whil having one GRF region you have GPIO banks
> pointing to different GRF regions.
>=20
> It's possible if you would have multiple GRFs, but you do not. You have
> one GRF, right?

per my reply to the grf binding patch, Rockchip invented yet another way
to describe their pin-config - in completely separate blocks strewn accross
the whole io-space this time.

So describing the associated pinconfig grf per bank, does sound pretty
nice for that problem.

In the early beginning Rockchip had one really big GRF for all of those
settings bits - which included the iomux settings.
Later on they moved _parts_ of that to another big GRF that still wasn't
dedicated to pin-config.
Recently pin-config got its own GRF - for all pins
And now it seems we're at one GRF per pinbank ;-) .

When I asked some years ago - when there even was usbphy control in here
(and those regs+bits also moved all the time), the _paraphrased_ answer
was "because hardware-designers find it nicer" ;-) .


Heiko


