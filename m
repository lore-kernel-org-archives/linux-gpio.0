Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B42478E27
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814142; cv=none; b=ZPacNCZOKj9gkOo5KnH7nh25xSJca+cjQ9QVnRFBJIU6A38FA1wOVC/q9Ft1Qsm40aTifKQmW2xyi7Cdw8qitwauOayGj5y4GpT+gbkSGcNzeKIYUdqHHVvxu/WUxE+TbSrq0V2NZ/rx2xQJjK/FP53XTcIuJH7ZYFEU3VApSyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814142; c=relaxed/simple;
	bh=rXDSy+BU+H+23ibWV85M7YcB8RMk/WwX+AGQ/LhTWeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4eIzDgd4xwnCTTHCp19t8IZ8dUQOGMX99Of3K/mdoSQll7Z05rsXuyW0ktqSGDjORgzFK/IqIaBt8dB0/dp/9ECXYdiIi391kDxgec8E31OG6iufC/WXdgciOGLWbw4pCEaidAUlZ2DG99OU9Bh0LQ+8fb3RhbJKMY3B8QBgJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDbvHozW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsBidhoM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDbvHozW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsBidhoM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0J1a1236677
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsMKY3ZM6LxGid9PCtLXClBhJ9KMfSEQKanq6xuXqIo=; b=FDbvHozWAc3Vgbvx
	k+iCtYU2yJzgCrXuH3dfRQI6rUCZKD/uYpqPUBF8Jku1UqzTpzlkJwsHSEIyEZXu
	rrLF1xKg1Muj1+bhF+YHnzMw0vxLZG5Cco3I/S/X0PC6hgfuhHXs/Ek+yPKyuHME
	9M1xLMk61eql1zhryplrcFVMSDVkp0B7ynll99K9zqpAvVutwh55icJ7tp6DqG1Q
	x2AzSC3t3JM2SgMUhalF1oatgGbd/YMExpBXJxEsRbJk1uXsjzcvjm30CWXizXWA
	dPiTm6YyXhPpZO7s7tPkffBVhvyzqx6wxZmzNATyx5ClcwzX9iRu//s81pvtBCSg
	Q67UzA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkbey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:09:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea9ea9d13so319208385a.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814140; x=1792418940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsMKY3ZM6LxGid9PCtLXClBhJ9KMfSEQKanq6xuXqIo=;
        b=FsBidhoMifn3IMwQBmyRPdnMhDhRqVCp5JU0Foa+Hql7I6ANEoFJdQux9OXSrGrDuM
         C5zHO5rwQ92qcHrGY6nX36Ld9dX5BBtXMYqCeJLjPbXXNPYH313jHDBxcRy0O2bH9NJv
         yEjDKnyPEVIwgyD5r2o+wsS+GsEKcFg627amCf/UqZHDUqoHyFIUFGja8BTDKWDXNcqb
         n3UTGGYtyp2SbGd/858KlsYgELIVjIWH9bzgpZ0qP3tZ9eoiTSvgO4hsJDUVI2Itor/W
         l2WFraG5mtqSaeZc/MlfXml1hXbGril75o45yoTmVpdYmmzuFTU+0YZyZF8uaOeVxjGR
         7iSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814140; x=1792418940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsMKY3ZM6LxGid9PCtLXClBhJ9KMfSEQKanq6xuXqIo=;
        b=JKihXk2ie3hRq5UncP35Ao3M+5Il49MTyQ4AbFhk8SvjXCBMPYwSDhymgNKlZvy/Im
         MnA5of9qt5HXr68GLAp/vmeNLa/q+5mPVmooVoCD8z9StJJW7cxxLUEDGfCFe8Ine7sM
         +9voxeVgJnBL5M15vaHqIYNiT+wv2/ogBL5s67/0ilj53Vp04Y2T9gnvQ6fyA6UCj4Nu
         1vy7TuRf6xqnOyFHYdHM6lw/UxnoEdaTWvJC0wrSHnoiQ7X4yMlPb2oxxAA0XNfupn16
         b6L07OGVaol9cPO2UvEA3fouQfivg1GZumVcmI3rAKfJeGzyQJt/YzPg6O28zr4c9hXr
         Z3cA==
X-Forwarded-Encrypted: i=1; AKwUvBzE7oF5bjUWuTPtYPydTLtMKtfjqfW3K9xru8DRwrGNnYXzCTtknlOlwGEPRPBqH8cJ6GCqri7Shzt6@vger.kernel.org
X-Gm-Message-State: AFq9FYIKr1Un5eU418eA1HcEBjF8A97kX2F8e7uDiPZwMcYeFQHzNQfy
	Zer5YxEikz1Ju8lzv+FecMg6HYS9dOe2FC174ZtfUOyaFamyIJiF7wbNiqElwnDl0PuHXsq1eIz
	8YLKbTngTbUXlFx6aNfIj+Z04GTp61v6J94X8uXlwbeuDz9UNkd/Ah7dVl3uEyfLp
X-Gm-Gg: AYBFou3V7w2BNf/s3EC3A+VzIGBwGyjRpAKU0/r3kekEjDfc2FTXZ0FZjlWW/Q8Xs3l
	2pOv+JDmpRwyP5UK59iR4dEN9tv0IynS6nZBQK+RvzAdsmwPW6bQBUZZfHEiAXblyhq7Sc4tUxT
	F7xSiqF6b1l/v4RpH+eCK/bRD+ot/bR11LRQsHCnoLiGVh84IqaFCa0mMR0kmUQQqbDI0m39Udw
	06yevZhdnUSGwZSWiejLVKlVTRadtwqG/1RkRt3SIl1KNAdCxVo5PbyUVmydrWQTUKR2upSffYk
	NRhbQ0TmbCI8mJ3td4pfeZgJDwxkqXaFw1Q6QG2NTN99WJRClXowllulwH/IwWrX90TxC1uywo/
	yHpEz1gHCgj5o+v30rC6GQb8INZs=
X-Received: by 2002:a05:620a:4693:b0:93e:6064:8996 with SMTP id af79cd13be357-93ebd0c3204mr1662159085a.8.1791814139887;
        Mon, 12 Oct 2026 07:08:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93e:6064:8996 with SMTP id af79cd13be357-93ebd0c3204mr1662154985a.8.1791814139458;
        Mon, 12 Oct 2026 07:08:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1a1feb78csm83436555e9.0.2026.10.12.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:08:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: fix building from the top level with O=
Date: Mon, 12 Oct 2026 16:08:56 +0200
Message-ID: <179181412811.12167.4474187537392007806.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011223358.2327625-5-sashal@kernel.org>
References: <20261011223358.2327625-5-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX7iY0V2qX9jWo
 Pn2l+pDSYef7khBJ6u2c6IdDwU6I5OfUchaSt2WQNxP7CuusjqilmNwqTpzGCOsBmleks0pprAr
 1/cYoGbpNF18OlGx9TgU/lLsGeTQKUWNth3GI476zzYlBhB7/+ZFP3lXNe6iCz+ABkv3IkocYjL
 yg3S9HikQh/+l4cUVmLMul6uIUVsa1OzNvaitdVWx5IBYDqt0A6oVDm8497TL+VRqSq4kcG8uLl
 Wamnm+Bu2T65k2XM8Pb02SDrVYt00fh7TBm0KwJAiwGmGZl4jT5OY4B/H4biTIAHsMaEMuFFWoh
 Cq9AKfS08cEE4YLeRrMhZ+qUJckQ/KNO+nVdOV4jh89eD28cz5URlFDd+X82MkrQBi26FwmddrW
 UUgIPvy0Lm5Q481Z3PcUbWnZM5SQJLQuhnTAGiFHtVVUlm/qYGXOYK0+ufUc+//Jpy9Hx2tbWaT
 lfEQ1VvpRVg0KmtJEzA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acce9fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=HJLiZkcYeBZheiffgpUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CQ4a4IQ5W0nYKljvutIJM6zMcGI5iCMl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX4tbAPQjEFsRq
 wmrghgOfX4pdErrMTnpmRCvucMJ2mUYx+6qdrbv7TkRJVMrEDHHlw19aDdSnU6qCggyWOyuZtty
 pfqSIVzPRi7+5MdzC0tRgad4qchUaZA=
X-Proofpoint-ORIG-GUID: CQ4a4IQ5W0nYKljvutIJM6zMcGI5iCMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056


On Sun, 11 Oct 2026 18:33:33 -0400, Sasha Levin wrote:
> "make O=<dir> tools/gpio" fails:
> 
>   Makefile:27: /tools/build/Makefile.include: No such file or directory
> 
> tools/Makefile clears srctree, and the gpio Makefile only works it out
> again when building_out_of_srctree is not set, which the top-level
> Makefile sets for O= builds.
> 
> [...]

Applied, thanks!

[1/1] tools: gpio: fix building from the top level with O=
      https://git.kernel.org/brgl/c/52336337f1a01ad803c7f3ddb23f40222e9ad58d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
