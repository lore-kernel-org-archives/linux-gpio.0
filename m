Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872059;
	b=xVUSHfEubxxUDhIGzDFm1AELQh4j9mnDtmiU/nLdBRLuSIDUWtH2th/83PasbSrpX3Fv
	 A97YeZfBQoVV/QlS/NLCD91+hYPQwUqlZhDaKDkF+JaF5/jrn0pY5kbfnfMAFS3F43jHF
	 exCbi+1Jrzq2ZlWBOqfPIqOSje1D3tFjXV/nqpveV1g8n3ksjAfy7o0C1ytFUapjLNl7k
	 W/WJG2zzFJAL0BlBJKdSUcK8AGNR2Io7oWBhK1Y+lfn2IJcK7ND+ucOo/Qk0evVwHDKha
	 8eKpogfonholYI3jH5Xxmce/meIBvv3vSBtxtmbps4nHM5gf357KRHZVALehZad64Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bG+4NoKM/POoluch9b/ukdst8PokUieRTLv6GsP22Do=;
	b=cwpsPCF6N3Vv7aNUczbhLVrvuN2gWVtZvG68WDq4N0r/rfbxhkWqJ9oIm0zgmPbNpkx2
	 R20RygKbrYxDbHN+yWEetkf5vyyGCQ5Mnlk1dvSmcErxJDaCoPS6LhSzKUCAyeqUP6AEp
	 ZSTm1CW4PfbG6ly88TC1rYYYc0tkYr0esgiiG3pi/rW1sXKTH8HAeYQPzIyGmq/yA7swM
	 GtwYVrepsvnB//tu+PkJtw5y0J+bxpOVFdpavE6L0O9ZDsUeLGeKPdcJ/mNBHHDQ1YXzp
	 ntfOC6bDrvxRWsJpNuAvuCKYekqvO2GPTAAG5iVy7Go9KjgOsdPBErexkfGvxzCyEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fydRdtzt;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712ED606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 20:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fydRdtzt
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843a4ca671eso976043a34.2
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 13:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872058; x=1793476858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG+4NoKM/POoluch9b/ukdst8PokUieRTLv6GsP22Do=;
        b=fydRdtztaz7cTtaW5/hDvFOcpJBd61rkbCKJzvfK4wL+z3tIw3cGlQrSD/oLT2YWaJ
         bJvLn44BOezxhLlHNDJ6UOIMMT1u/v9OZ08ucqWxTe3IWtzO1peY7PLfl5t2yb8+/rR7
         1SNioZutKLQKY2Z+FdfU1sktIdgJvh9oPdF/TIExKU7OLrrVw9dARpggHkaK6RE/1QKJ
         ezvnnaVQ1jb/hEl0tXckium910lan51RPwHO/UM70J5YwMu8zaQDrN4oTgeiqitSf642
         Dqx9M9j/b78SSu0jsNWX25DdGxoTNWknactN4dthTjQ3gJfggvF2mUg5b5KYi/FyV78V
         3g3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872058; x=1793476858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bG+4NoKM/POoluch9b/ukdst8PokUieRTLv6GsP22Do=;
        b=XfYkcz4Ed+MPXH9KTUvm8mDEZb9bmdLlVcgC3Ry/eckHxHIgQTGcfAUIgaBKqNQmpJ
         HnbdXLqvntx73kO1rxWEUxSVOdUlpYepDLMzRjRjbxuJkj/vwSQTahoiRb0KmHr1biTP
         q+HKCcfwC+kemaznHljeZ9Bl4J9/zXfFPL/dST186++CSltqbXcX5Pcx6dMZtnxpV77P
         c0HAxq5xgrAefVNC5XT8+d8Dgib1p7pyL7ECn7OMepP2dkR7+cs0y3JnmQl1KRcowmol
         JjS9sw26vrHmTT9kDW+uGGB6S+dQ+vrVo6se9Q+SoRbPTgv5ZKlb65qQ8L3tJ38mzAvJ
         1g9w==
X-Gm-Message-State: AFq9FYKuo+tTibJJr5226r4NLQ2pYLiDFWyQN+ABrVI94SbiwMHkaiNJ
	+FcLCHFXk0ceuYryVs02s7Cp2uyVP2Vm0/fOOmNhaix1xy4oUYMYhS+R0SH83g==
X-Gm-Gg: AYBFou0IYO/Pt31HKU6qnE1EU1YK/W/eJiXVnXkGjmVV/7CpjjbAMCqPURJhjdh78r5
	P+x3Etg0kAxGiURgW+vyaGYua2RDZEc+Jc218/HovNFAL5+Pu0HaeA9dLgkLWaH/HBx15zK9T+V
	2UUDU3aQwMenIZN5urErwa5nK1BoVI5/lTW61k5POAPcsUkSc8BsYBqL3shkkC+d3MjYDw3Sv7M
	lyB1hKnqnPV1K9wkfwF3UcFKD/uZcCgsMulRgG6t7gD3Fqdlu2Jsg++uo5sTamUryM6Qzphhpao
	gDkjcChR40Bj4BM38IJLAbCNKXdX8YndexupDnnSBkRP8+fLx1vVLxtd0B5OJfNpKR/OShocSHC
	S17PS0h/J58V9I4MV6cymqDCPNBdnxhpEp4UoYFINPJ2qv/5r3ZN8qsKIk3VD3S7kAQrQt4rYTy
	ChzV2dB7tRll5GMI55NwnWYpdUxkuHKcZke1o2J8NHL7PF7jgGcxTfUzTVtmp5BkoZhs+eSLhBs
	UNEBW9VbZlrznQ7VR/C8612bOUZ02YvIxxDynMe7tWm9HkkTMcCbjA4zQWKUkP1LKcRFy0l+3yc
	rITVGuKNizfDn7Xarw==
X-Received: by 2002:a05:6808:2f18:b0:4e6:76eb:b997 with SMTP id 5614622812f47-55c0035e636mr1700076b6e.62.1792872058456;
        Sat, 24 Oct 2026 13:00:58 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042da8c5sm1731361b6e.14.2026.10.24.13.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:00:58 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 13/14] bindings: python: fix directory validation in artifact script
Date: Sat, 24 Oct 2026 15:00:47 -0500
Message-ID: <20261024200048.25987-5-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024200048.25987-1-vfazio@gmail.com>
References: <20261024200048.25987-1-vfazio@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PyPI artifact generation script had two issues with its directory
validation:

  * When validating the source directory, it erroneously tested whether
    output_dir was a directory instead of source_dir.
  * When validating the output directory, it only tested for writability
    (-w), which would allow an existing writable regular file to pass
    validation and only fail later when copying build artifacts.

Fix the source_dir check to inspect source_dir, and ensure output_dir
is verified to be a directory in addition to being writable.

Fixes: 72d2fa01 ("bindings: python: add script to generate sdist and wheels")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/generate_pypi_artifacts.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index 22dad9f..bc8aa05 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -58,13 +58,13 @@ while getopts :hv:o:s:cf value; do
 	esac
 done
 
-if [ -z "${source_dir}" ] || [ ! -d "${output_dir}" ]; then
+if [ -z "${source_dir}" ] || [ ! -d "${source_dir}" ]; then
 	printf "Invalid source directory %s.\n" "${source_dir}"
 	exit 1
 fi
 
-if [ -z "${output_dir}" ] || [ ! -w "${output_dir}" ]; then
-	printf "Output directory %s is not writable.\n" "${output_dir}"
+if [ -z "${output_dir}" ] || [ ! -d "${output_dir}" ] || [ ! -w "${output_dir}" ]; then
+	printf "Output directory %s is not writable directory.\n" "${output_dir}"
 	exit 1
 fi
 
-- 
2.43.0

