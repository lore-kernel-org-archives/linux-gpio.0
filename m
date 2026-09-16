Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9626848AE39
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549331; cv=none; b=o9DX8aqyuMWiQUgVRdSqKSPWoJmOzhzFjC+R0vCxZG2dFmYUuQstuiYz6+WRLs+M9ZpQovBvhZdtvLYorxTFBi+YKbcpCzwugy/gc8+V/omagr+ioMUaFWkmoVjnfSVl4yn0hY4wj75+jsBl9+14gYO2vvby5aIAit6zh94pOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549331; c=relaxed/simple;
	bh=r9Q8CXvGxe0d1gFFAq8dmgIyqj34U9uBRqhGzo7Tk38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZNA6b+S2ztflDZgjw+QFev1xyoKl4KyoWIPl7w2UNeJRCL6EWJTtVYx9pC21163C++vzwBZoPKqyFuLRaAPwrgJpvMPX865JWwDD9wD4xHA/nsGyWZyLKpUSi5NiY7cANp7XdlhsYiNHktSFQc4rI2UFbS3AiAHvxg2PjgUc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2ezgGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwAcTCbX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2ezgGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwAcTCbX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G698Ff1830705
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=; b=O2ezgGsWYxJS6Y+K
	A+2pH5fxgPofFY70ilnqTCBYJrx/0TE3+ybKzgV85qRKN0ycYgCuM5GFCDcux82E
	6ZJ6grPzj3iC4oqsBBg/AiE7QusQjb84yMZijpRuuS6D+oXMltMdx96JF1tu5Pdi
	SxNyEWAwaqCvXDdZNiEcsd4qY/N+VgP52cCiAJ6OFXlwfBWqgNhwTsNOXHZEZ6Sp
	KqNeTv45Pe1fI4drfUHsPv2HE6X5KtUOUQb5h9Izk64C0kJb4uPZJl8eP4VfJ+rg
	1HVFbNnXrKOsd+1GQPittF+4euE7VPMTu5lC6gfqLe+/4o3iK7dDqrW47HF6ksAb
	cEucRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ud9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:01:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so842782485a.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549305; x=1790154105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=;
        b=DwAcTCbXk8hCf+uCc5iOeR4lXiJ1eD9xm3XWw2qEN4W/ksEi5P/Hze6ZIrGuti+Red
         CgV74xxcdNBq797nrDfD5/arPQMd6KiwRoKNlLHqVO3bThp5epevfCQqIE/uD6ZH0cTO
         JB5ktHZyTryLX+ZH8OmfOqYGJkHo6rNSyldzo0515g40PvHcQp5QNEkfN06lrXr6AKPO
         +c33HJtgWhzDfqP7Ore/Yc4MduaxLSa3PT8J/YnngUrpd+56hPDfmUVRo97eQ8Lbik1I
         QZbdwO3YntepWDZ2ewmr2Bvec2GXFrhzshyVNLF8EO+W5ixRVdC5CQpuQApvsPmQUQQh
         GajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549305; x=1790154105;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=;
        b=v9/hyDU5CzH5BF+l1NP5xQnAUec1bvh+neIqSsRbxTSuouEhcZ7AdKBp16mr+zXBCE
         bRmkkfH2jtFZzyr+r4F6JewV9J5NXQ6pXwh/ivueiB3W5CNOVor3J/16g31QBJAjaCm6
         R4qPKo0ypDVvJ6vamVsvcrhEPN6y4xXhtXpRXtXminr2OQHDt9Cfq88zRubJABi8w1Ji
         pjehe35rU6yEeFM9Jbq4xXwYUQRmSwKwdOdyxcdyqgyVvz3GFkrET8e3BJRXxlO4HEvg
         furNvIvii+wJS08l7RmA/AcRik+z/9yhnL/5YX2vE/1ERAD8zFhk66MK7A6BeeDYV0WC
         IkXw==
X-Forwarded-Encrypted: i=1; AKwUvBwYD5O+y0IfN8J7icx4L5JDyjF6DaQSYFKLSITiH2FXJihNeNN8P+1bN1+MCvubMyxPS5Vmf6nmRDXQ@vger.kernel.org
X-Gm-Message-State: AFuF++ncIY6bMaawg98OTQf3lbLY5AmvISWUCaBT34oGrv0hEOGBDBm5
	GzexJby8O6HXIlkAI76HHAelrFlun6aS90ozIR8LxTuuEjSUKcFg6z85onvzSx+wvdhz7oOCqf5
	U1iLVxrKhMQuzAeU6MT+48BhgExWj1hgRpB/fN1OMiPTqmHDRVCpCljBOF+56Xmie
X-Gm-Gg: AYBFou1c7ciEec89Xu8+edczQaMFcpCX2CyCHhzkzaovfC2VaLMBJ3MBS+5HjQFclmH
	jSNrnCx0B7Gd5V6T82VJVUST5mArq6Na3ohvK+wcITr6EYlb+TQEqnpSO4QPi14FC4+nwoHpAWL
	teHJcKw+LlfvmrgIo09tqMLHVEOyyMmjUGfK2e7GzkrEGBCHpDOYvJZLpgHug7ahpInT1EnDaPI
	lmuufNLXMNJJdiS3xNz07ltynjamOiPBqDOtnb4IyaD7ikuVrbEBXrpIZZFPbtBOwYKokHLnada
	F6Bb+82j8aMN+7Y8H2DjLMOLTWsb/5IVpcqTM6Sni6Z7FOHRZN0uZT8ufzNlQmKEuXeCmhcNEm3
	5n+isxaD5rPAUMQ84wEInIDS1H34=
X-Received: by 2002:a05:620a:288b:b0:939:6de6:5487 with SMTP id af79cd13be357-93bb794cca1mr249162185a.44.1789549305072;
        Wed, 16 Sep 2026 02:01:45 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:6de6:5487 with SMTP id af79cd13be357-93bb794cca1mr249153885a.44.1789549304517;
        Wed, 16 Sep 2026 02:01:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm6473464f8f.2.2026.09.16.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:01:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: Include value in debugfs output
Date: Wed, 16 Sep 2026 11:01:40 +0200
Message-ID: <178954925614.6008.15490710195931026839.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
References: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa5af9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xM0vMNglaa6g24SigUgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KL_sw9F1NtASwx8iCAvfv8x337cGaBU-
X-Proofpoint-GUID: KL_sw9F1NtASwx8iCAvfv8x337cGaBU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX0Dj968CMU6Cd
 gMM6npKXUUq8SmYlCrZOwEejIjhV8TWP5j+nBkGHL2KpBEP3kaE/mbGLvx20RoGQV17Jpvx+kNi
 27ZqFHA5OGPCogCZzUBZPuD+H5PHUewfk97bHq0ugkIlAg5t3KStWe/mspKT7mOeyX9vXVr7Emz
 /gSX5dgF6OfWS0acj9i3hpgiwmgbhn7q7jz7zAbl889fL7kF0cusoJpzPlharipKEFI7y8Ab0dw
 dZIZmmRsIe1dUBlwEeckzkltaoe3KxEIFqjwpAN9WevjH5031SOWgmHTP1Qq1HeBO/ULLcPOyjj
 FhJHFS2oXWtOwWApqNIKTTAIWqDN6aT8E+d4Pn/XjNHMAVQ2zyZzsOkSg8g4op//OY/nOZ0sZoO
 BUkk/+wnxk4XF1SnEqUiqo8WB0DqlPPg4D0UziK608l+8vtJQgmvG2k3wk/fDtb9pnJOvH/4SSr
 B2dH4fzsdgAR1juAxrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX8r7o00QY8tT2
 ICyQQ2SD1iU2axqJf2RuXDVALaCza7Q6PmuSxjY0ahcaVBLDWS8Ba0SKPpQx3wSjZvkkYQRsiqz
 S3SbXivGSeqIkJoQ2uD97M2XurQy8FY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116


On Tue, 15 Sep 2026 19:00:15 -0500, Bjorn Andersson wrote:
> As with other pinctrl providers, it's useful to be able to inspect the
> current GPIO state of the LPASS LPI pins during system integration and
> debugging.
> 
> Extend the driver's debugfs logic to read the current value and include
> this in the printout.
> 
> [...]

Sashiko's probably right about the return value check but it's debugfs so I
won't worry too much.

[1/1] pinctrl: qcom: lpass-lpi: Include value in debugfs output
      https://git.kernel.org/brgl/c/d29bfb93a19771b822dab6d7adbbbaf188cb1db5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
