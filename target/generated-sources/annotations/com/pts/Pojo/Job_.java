package com.pts.Pojo;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Tintuyendung;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2022-02-17T19:58:47", comments="EclipseLink-2.7.9.v20210604-rNA")
@StaticMetamodel(Job.class)
public class Job_ { 

    public static volatile CollectionAttribute<Job, Tintuyendung> tintuyendungCollection;
    public static volatile SingularAttribute<Job, Integer> id;
    public static volatile CollectionAttribute<Job, Candidate> candidateCollection;
    public static volatile SingularAttribute<Job, String> title;

}