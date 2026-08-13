Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939F37106E
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 17:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642249; cv=pass; b=SKa0hbn1bClsVgxixGzjgWKU4pybXAv0Ug4mCur91ufXvM5nVDXpbx5+728AzaTT4VeBZyrknfwnCZjoH9cI3lUlP/Y9XF3OMFbdhQeO0aMiH3WYESrrGksTETErhtj+So/ezA0omUHzFHbwqA7U2680Ir7tRY/73UPRW0DszLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642249; c=relaxed/simple;
	bh=j6QfLqXa8jcIwV7hSiUleBvLmTNg0gTGUTYVxXAyLqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db7YnMPpGCx0WGCQo8K1pctzurylURafanQG7ND+oumuDH99/k2k2PBdLwBxilsFy3AZzvpwIhnzReeozbhHLLF+oRm/RLTID5W55X4owwHY4fxbf6wAUfT48vfc1GLrphk3cvLm/saQCMyLUt5lgtsjITrRnb0H4KD6yzRmWDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrJ6xBQw; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrJ6xBQw"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66c70f69d3fso172733d50.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 10:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786642246; cv=none;
        d=google.com; s=arc-20260327;
        b=okXsjDAPQ0MLijwYWgjYrQd2P7Fk55sot6xr03FlkdqvcL3Vo7tu5FaEEmqP4+lzcS
         FJ8lOWGE8ckj7Yq1gVtzlTys/1tWgy1qZLJeiYokxfw3YbLyrTLyoMJ0KnW23Epkdcw9
         iHEZuXs1KqCozSeSpid9QJxzKegpoxjw2Z7wkEZO71JX9Qr0+/k0GHQ7CU2+gG5fwjmH
         xxYe3/2/h7dZc6SJPnNXuzQUzAe7ft/78veQ1+mSdoJZlWwUoJZa1V2QToVTxG37qPbK
         BXl5+Ll4oRTId+5rhS9N6txRGx2/rqsLMSZLTF5GEXKwxKDrPqOPB2z0pWSrxH9GV//b
         aAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lx9QfW1jBnBLne5zOp4UBd9Snkw8zs0lPJtwYteOAIM=;
        fh=/ZVGVDNjR3vSWK/UpoaMoMdBHzgJCDWeWuUlKCGtpew=;
        b=KvD5TBqrPQMQd4pg1jchYFaIH8MS4X04bn1ykBWLKJ8j+MgIHkjxj/l25QwTuxDxPN
         /Y9xgusjRaEvGKBadvF6Xcy2IsA02+ugUEdTfnMRObZefQ5jJ472gLyDqFv7RyTz/SGJ
         EfajO/234FWD8Sx5OAmw/V0yzpjGhdkeX7wvvhrlQInqCv8YRPuHfJtohPqRSLGvZmq7
         JDI3ZSjMn9QKiN6ypM5FlHKsHZ4heoJc8cKKyw7fgbF5xP64oxUbh9eg29he/tIPQma6
         K5V65r0t5YFNpV03ER1pCsVTFAT/9YTpYzUMch/0pG28mxEgJT49iD37DaAdLHKgZNGu
         ttJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642246; x=1787247046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lx9QfW1jBnBLne5zOp4UBd9Snkw8zs0lPJtwYteOAIM=;
        b=lrJ6xBQwLMP9ohLhH9eznjaB2sJRcCKVdYlhnI4As6qk0KoF3r+fTTn+3Q0QrbvexF
         03NABE1d1FPaNCExUyDNf10OP+ea7mh4Uibq2OGFMHfrXdYIOl4eOvfsBOSzuTna5sKM
         ZVu6BR9vTdsyPJVeU53q0apQK7r3D0/jgFb0d3KgHuJmop42vAGvuutI/000ACT841Sa
         sGrwFHM50J3Xk7/+EzZBkqg6kgS8JV2hspFfPyOT3mERtxkhBdSQbfNjvjafj1zkrqDm
         GtmQ9eQ//h/nSp0ZI6lQ6xwM8sWtyvm978QIGjV6jVU0QoU8c4Rvl/ewab4Z4kMbDg6G
         fGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642246; x=1787247046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lx9QfW1jBnBLne5zOp4UBd9Snkw8zs0lPJtwYteOAIM=;
        b=W7qYuw2ljalGGDai7Er8XA9/VArTqyFwshdnG6xKRvxh1zIW1EDl7kBfJWNpzitFMi
         Hgg83wSabP+I2pYoLZrHXB6xESwzKUv7t9YuIXW3XnXIzQ5cxseuRWmETDpVi+HH2tX9
         z8Wuk7fafOfALAoTXdfiG0GrBKVNFpuDH3WU5MQww0Wlpfa1ebml5ezYoeswth7STCg+
         MGXFAc8FYlGa3CAfyuWa/4h4srTN+dgbujhud4L/12RJ1mkQukfJDaKXw9rZCgL/75YK
         bXY/91tlLXY4hHrruaudjR8p8yUzHlegKknjG62SSo7bAyJ/fFeBIegrdsmkj0w+lnAj
         7tTg==
X-Forwarded-Encrypted: i=1; AHgh+RqO4xuXh2lm9SRpKnhaGZe4ArmsjpW1/jbyzMH9LsiiFuOuoZN/Os6jXhiNkls/m0BdusE4zNv7ejRI@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOjywGcCYo8nvP7UPc7ceDCJc6a/CUQDKjg+7R/FntSjHz4q+
	s4FTAZxVsf/fe05+TZxX3ti8U7dOaY3p28AR9ocup/M+vCtDbB2jg/TBS1c8JAmxCHPa43z6C2c
	m/lSm5KXi1z2EAzkAxQkWhb5/zr5tMCTxMTpIdAKekQ==
X-Gm-Gg: AR+sD11HGtgHbbXEx8IRFI1/ZcB0hDXjmVsq6SwV8Y989OZNmxO8rcTPrffPwldEP4e
	XowgUkhKo/Jvc/bybASh5HvEbPRhQr2jbjh6tbrYt40lXfxWDXFnspGwxTL1pzOntPowvya+e0O
	VWKtXhS7T0JYCjIHlVb9Yew0fr+XP4fojgnQNzRIvgM0iZkLocNmSM3Ki+Dn34HU0z+YmteN8VW
	njJt07MwksYaRCzdSHBHBE9pX4zd1eUp0eW061e/BVIQQhrkkbl31l8o7BZhOW/RejYzpHUFjqh
	n62s2se0RBrIu6u3PHBEpLUlPwi9rpH/2OvUo4pAbHKhaXVnB87u9YNvT0QFYI8inlZZKFN3N0M
	Z
X-Received: by 2002:a05:690e:a4e:b0:664:f064:f65f with SMTP id
 956f58d0204a3-66c72be335fmr44263d50.23.1786642246132; Thu, 13 Aug 2026
 10:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731174551.86367-1-challauday369@gmail.com> <178579584771.736715.6031577704790719107.robh@kernel.org>
In-Reply-To: <178579584771.736715.6031577704790719107.robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Thu, 13 Aug 2026 23:00:33 +0530
X-Gm-Features: AUfX_mwXdyvwqFkMfTSB4bW5XkPxnXQPKGMGnB_Yh8wf4BAqLLqwT8ujk06-mCw
Message-ID: <CAAj-GBmvcG62NddVS3UMEK6tQ2UKBr+=KCXe15jhCEtB+JWXKQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, me@brighamcampbell.com, skhan@linuxfoundation.org, 
	linusw@kernel.org, linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 3:54=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Fri, 31 Jul 2026 23:15:51 +0530, Udaya Kiran Challa wrote:
> > Convert Microchip PIC32 Pin Controller devicetree binding
> > from legacy text format to DT schema.
> >
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> > ---
> > Changelog:
> > Changes since v4:
> > - Add reference to pincfg-node.yaml
> >
> > Link to v4:https://lore.kernel.org/all/20260722123243.341346-1-challaud=
ay369@gmail.com/
> >
> > Changes since v3:
> > - Drop "|" from description fields
> > - Remove '#address-cells' and '#size-cells' properties from the schema
> > - Consolidate repeated pin-node property definitions into a single
> >   $defs/pin-node entry
> > - Replace the two patternProperties blocks with additionalProperties
> >   using oneOf to allow either:
> >   - container nodes holding nested pin configuration nodes, or
> >   - direct pin configuration nodes.
> > - Update $ref to use the absolute schema path
> >   /schemas/pinctrl/pinmux-node.yaml#
> >
> > Link to v3:https://lore.kernel.org/all/20260719183431.124061-1-challaud=
ay369@gmail.com/
> >
> > Changes since v2:
> > - Add container node for grouped pin configuration sub-nodes
> > - Correct regex patterns of direct and nested child nodes
> > - Fix interrupts values in uart2 example
> >
> > Link to v2:https://lore.kernel.org/all/20260707144223.120417-1-challaud=
ay369@gmail.com/
> >
> > Changes since v1:
> > - Add interrupts and clocks to uart2 example to satisfy uart schema val=
idation
> > - Corect regex patterns to accept standard DT node naming conventions
> > - Add function property to top-level pin configuration nodes
> > - Remove restrictive enum from function property to support all mux fun=
ctions
> >
> > Link to v1:https://lore.kernel.org/all/20260705132521.159522-1-challaud=
ay369@gmail.com/
> > ---
> >  .../pinctrl/microchip,pic32-pinctrl.txt       |  60 ----------
> >  .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 109 ++++++++++++++++++
> >  2 files changed, 109 insertions(+), 60 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip=
,pic32-pinctrl.txt
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip=
,pic32mzda-pinctrl.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>

Thank you, Rob. This patch has 2 parts(dt-binding & dtsi changes).
Can you also please review dtsi changes?
https://lore.kernel.org/all/20260731174751.86819-1-challauday369@gmail.com/

Regards,
Udaya Kiran Challa
